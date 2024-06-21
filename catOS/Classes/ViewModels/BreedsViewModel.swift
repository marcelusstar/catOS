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
    
    var filteredBreeds: [String] {
        guard !searchText.isEmpty else { return breedsName }
        return breedsName.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    @MainActor
    func getBreeds() async {
        guard breeds.isEmpty else {
            return
        }
        
        do {
            loadingData = true
            breeds = try await ApiManager.shared.getBreeds()
            breeds.sort{ $0.name < $1.name }
            breedsName.removeAll()
            breedsName = breeds.map { $0.name }
        }
        catch {
            self.error = error as? CatError
        }
        
        loadingData = false        
        
    }
    
}
