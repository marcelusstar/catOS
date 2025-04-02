//
//  ApiManagerMock.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

struct ApiManagerMock: ApiManagerProtocol {
    
    static let shared: ApiManagerProtocol = ApiManagerMock()
    
    
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let feedImage1: FeedImage = FeedImage(id: "0", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg")
        let favorite1: Favorite = Favorite(id: 0, userId: "ctangana", imageId: "0", subId: "subId", createdAt: Date(), image: feedImage1)
        
        let feedImage2 = FeedImage(id: "1", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/der.jpg")
        let favorite2: Favorite = Favorite(id: 1, userId: "ctangana", imageId: "1", subId: "subId", createdAt: Date(), image: feedImage2)
        
        return [favorite1, favorite2]
    }
    
    func addToFavorites(imageId: String) {
        return
    }
    
    func likeImage(imageId: String) {
        return
    }
    
    func dislikeImage(imageId: String) {
        return
    }
    
    
    
    static func getBreedExample() -> Breed {
        return Breed(
            weight: Weight(imperial: "7 - 10", metric: "3 - 5"),
            id: "abys",
            name: "Abyssinian",
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            countryCodes: "EG",
            countryCode: "EG",
            description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
            lifeSpan: "14 - 15",
            indoor: false,
            lap: true,
            altNames: "",
            adaptability: 5,
            affectionLevel: 5,
            childFriendly: 3,
            dogFriendly: 4,
            energyLevel: 5,
            grooming: 1,
            healthIssues: 2,
            intelligence: 5,
            sheddingLevel: 2,
            socialNeeds: 5,
            strangerFriendly: 5,
            vocalisation: 1,
            experimental: false,
            hairless: false,
            natural: true,
            rare: false,
            rex: false,
            suppressedTail: false,
            shortLegs: false,
            wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
            hypoallergenic: false,
            referenceImageID: "0XYvRd7oD"
        )
    }
    
    
}
