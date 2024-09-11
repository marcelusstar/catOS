//
//  BreedDetailedViewModel.swift
//  catOS
//
//  Created by rosadiez on 10/9/24.
//

import Foundation

class BreedDetailedViewModel: BaseViewModel {
    
    var breed: Breed
    @Published var urlImages: [URL?] = []
    @Published var images: [FeedImage] = []
    
    init(_ breed: Breed) {
        self.breed = breed
    }
    
    init(_ breed: Breed, apiManager: ApiManagerProtocol) {
        self.breed = breed
        
        super.init(apiManager: apiManager)
    }
    
    @MainActor
    func getImages() async {
        do {
            self.images = try await apiManager.getFeedImages(limit: 10)
        }
        catch {
            
        }
        
        
    }
    
}
