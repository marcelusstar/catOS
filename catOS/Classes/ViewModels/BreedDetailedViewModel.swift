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
    var characteristicsViewModels: [BreedCharacteristicsItemViewModel]
    var characteristicsTitle: String = String(localized: "breed:characteristics_title")
    
    init(_ breed: Breed, apiManager: ApiManagerProtocol? = nil) {
        self.breed = breed

        characteristicsViewModels = [
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_adaptability"), score: breed.adaptability),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_energy_level"), score: breed.energyLevel),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_child_friendly"), score: breed.childFriendly),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_social_needs"), score: breed.socialNeeds),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_shedding_level"), score: breed.sheddingLevel),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_grooming"), score: breed.grooming),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_health_issues"), score: breed.healthIssues),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_stranger_friendly"), score: breed.strangerFriendly),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_affectionate"), score: breed.affectionLevel),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_dog_friendly"), score: breed.dogFriendly),
            BreedCharacteristicsItemViewModel(name: String(localized: "breed:characteristics_intelligence"), score: breed.intelligence)
        ]
        
        if let apiManager = apiManager {
            super.init(apiManager: apiManager)
        }
        else {
            super.init()
        }
    }
    
    @MainActor
    func getImages() async {
        do {
            self.images = try await apiManager.getFeedImages(limit: 5)
        }
        catch {
            
        }
        
        
    }
    
}
