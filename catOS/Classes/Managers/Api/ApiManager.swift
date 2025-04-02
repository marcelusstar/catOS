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
 
    
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let favoritesEntities: [FavoriteDTO] = try await requestManager.doAsyncAwaitRequest(apiRouter: .myFavs(userSubId, page))
        
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
