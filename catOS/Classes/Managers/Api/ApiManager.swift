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
    let apiTransformer: ApiTransformer
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         apiTransformer: ApiTransformer = ApiTransformer()) {
        self.requestManager = requestManager
        self.apiTransformer = apiTransformer
        self.userSubId = CustomUserDefaults().getUserId()
    }
    
    private func getImages(limit: Int, breedId: String) async throws -> [FeedImage] {
        let feedImagesEntities: [FeedImageEntity] = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.feedImages(limit, breedId))
        
        return feedImagesEntities.map { apiTransformer.transformFeedImageEntity(entity: $0) }
    }
    
    func getFeedImages(limit: Int) async throws -> [FeedImage] {
        return try await getImages(limit: limit, breedId: "")
    }
    
    func getBreedImages(limit: Int, breedId: String) async throws -> [FeedImage] {
        return try await getImages(limit: limit, breedId: breedId)
    }
 
    func getBreeds() async throws -> [Breed] {
        let breedsEntities: [BreedEntity] = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreeds)
            
        return breedsEntities.map { apiTransformer.transformBreedEntity(entity: $0) }
    }
    
    func getBreed(id: String) async throws -> Breed {

        let breedEntity: BreedEntity = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreed(id))

        return apiTransformer.transformBreedEntity(entity: breedEntity)
    }
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let favoritesEntities: [FavoriteEntity] = try await requestManager.doAsyncAwaitRequest(apiRouter: .myFavs(userSubId, page))
        
        return favoritesEntities.map { apiTransformer.transformFavoriteEntity(entity: $0) }
    }
    
    func addToFavorites(imageId: String) {
        try? requestManager.doAsyncRequest(apiRouter: .favImage(userSubId, imageId))
    }
    
    func likeImage(imageId: String) {
        try? requestManager.doAsyncRequest(apiRouter: .voteImage(userSubId, imageId, true))
    }
    
    func dislikeImage(imageId: String) {
        try? requestManager.doAsyncRequest(apiRouter: .voteImage(userSubId, imageId, false))
    }
}
