//
//  BreedsViewModel.swift
//  catOS
//
//  Created by rosadiez on 7/5/24.
//

import Foundation


class BreedsViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var breeds: [Breed] = []
    @Published var breedsName: [String] = []
    @Published var error: CatError?
    @Published var loadingData: Bool = false
    
    var filteredBreeds: [Breed] {
        guard !searchText.isEmpty else { return breeds }
        return breeds.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    let getBreedsUseCase: GetBreedsUseCase

    init(getBreedsUseCase: GetBreedsUseCase = GetBreedsUseCaseDefault()) {
        self.getBreedsUseCase = getBreedsUseCase
    }
    
    @MainActor
    func getBreeds(forceRefresh: Bool = false) async {
        guard breeds.isEmpty || forceRefresh else {
            return
        }
        
        do {
            loadingData = true
            breeds = try await getBreedsUseCase.execute()
            breeds.sort{ $0.name < $1.name }
        }
        catch {
            self.error = error as? CatError
        }
        
        loadingData = false        
        
    }
    
}
