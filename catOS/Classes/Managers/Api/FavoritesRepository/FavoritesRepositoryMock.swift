//
//  FavoritesRepositoryDefault.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

import Foundation

struct FavoritesRepositoryMock: FavoritesRepository {
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let userId = "ctangana"
        let createdAt = Date()
        let subId = "subId"
        
        let feedImage1: FeedImage = FeedImage(
            id: "0",
            breeds: [],
            categories: [],
            height: 10,
            width: 20,
            url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg"
        )
        let favorite1: Favorite = Favorite(
            id: 0,
            userId: userId,
            imageId: "0",
            subId: subId,
            createdAt: createdAt,
            image: feedImage1
        )
        
        let feedImage2 = FeedImage(
            id: "1",
            breeds: [],
            categories: [],
            height: 10,
            width: 20,
            url: "https://cdn2.thecatapi.com/images/der.jpg"
        )
        let favorite2: Favorite = Favorite(
            id: 1,
            userId: "ctangana",
            imageId: "1",
            subId: subId,
            createdAt: createdAt,
            image: feedImage2
        )
        
        return [favorite1, favorite2]
    }
    
    func addToFavorites(imageId: String) {
        return
    }
}
