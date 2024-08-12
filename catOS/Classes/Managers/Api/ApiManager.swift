//
//  ApiManager.swift
//  catOS
//
//  Created by rosadiez on 5/2/24.
//

import Foundation


struct ApiManager: ApiManagerProtocol {
    
    static let shared: ApiManager = ApiManager()
    let userSubId: String
    let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
        self.userSubId = CustomUserDefaults().getUserId()
    }
    
    func getFeedImages(page: Int) async throws -> [FeedImage] {

        let feedImagesEntities: [FeedImageEntity] = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.feedImages(page))
        
        return feedImagesEntities.map { ApiTransformer.shared.transformFeedImageEntity(entity: $0) }
    }
 
    func getBreeds() async throws -> [Breed] {
        let breedsEntities: [BreedEntity] = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreeds)
            
        return breedsEntities.map { ApiTransformer.shared.transformBreedEntity(entity: $0) }
    }
    
    func getBreed(id: String) async throws -> Breed {

        let breedEntity: BreedEntity = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreed(id))

        return ApiTransformer.shared.transformBreedEntity(entity: breedEntity)
    }
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let favoritesEntities: [FavoriteEntity] = try await requestManager.doAsyncAwaitRequest(apiRouter: .myFavs(userSubId, page))
        
        return favoritesEntities.map { ApiTransformer.shared.transformFavoriteEntity(entity: $0) }
    }
    
    func addToFavorites(imageId: String) {
        requestManager.doRequest(apiRouter: .favImage(userSubId, imageId))
    }
    
    func likeImage(imageId: String) {
        requestManager.doRequest(apiRouter: .voteImage(userSubId, imageId, true))
    }
    
    func dislikeImage(imageId: String) {
        requestManager.doRequest(apiRouter: .voteImage(userSubId, imageId, false))
    }
}
