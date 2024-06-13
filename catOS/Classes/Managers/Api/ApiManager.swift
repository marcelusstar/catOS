//
//  ApiManager.swift
//  catOS
//
//  Created by rosadiez on 5/2/24.
//

import Foundation


struct ApiManager {
    
    static let shared: ApiManager = ApiManager()
    
    func getFeedImages(page: Int) async throws -> [FeedImage] {

        let feedImagesEntities: [FeedImageEntity] = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.feedImages(page))
        
        return feedImagesEntities.map { ApiTransformer.shared.transformFeedImageEntity(entity: $0) }
    }
 
    func getBreeds() async throws -> [Breed] {
        let breedsEntities: [BreedEntity] = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreeds)
            
        return breedsEntities.map { ApiTransformer.shared.transformBreedEntity(entity: $0) }
    }
    
    func getBreed(id: String) async throws -> Breed {

        let breedEntity: BreedEntity = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreed(id))

        return ApiTransformer.shared.transformBreedEntity(entity: breedEntity)
    }
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let subId = "soyelctangana"
        let favoritesEntities: [FavoriteEntity] = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: .myFavs(subId, page))
        
        return favoritesEntities.map { ApiTransformer.shared.transformFavoriteEntity(entity: $0) }
    }
    
    func addToFavorites(imageId: String) {
        let subId = "soyelctangana"
        RequestManager.shared.doRequest(apiRouter: .favImage(subId, imageId))
    }
    
    func likeImage(imageId: String) {
        let subId = "soyelctangana"
        RequestManager.shared.doRequest(apiRouter: .voteImage(subId, imageId, true))
    }
    
    func dislikeImage(imageId: String) {
        let subId = "soyelctangana"
        RequestManager.shared.doRequest(apiRouter: .voteImage(subId, imageId, false))
    }
}
