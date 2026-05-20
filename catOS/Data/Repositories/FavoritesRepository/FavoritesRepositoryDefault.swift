//
//  FavoritesRepositoryDefault.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

struct FavoritesRepositoryDefault: FavoritesRepository {
    
    let requestManager: RequestManagerProtocol
    let apiTransformer: ApiTransformer
    let userSubId: String
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         apiTransformer: ApiTransformer = ApiTransformer()) {
        self.requestManager = requestManager
        self.apiTransformer = apiTransformer
        self.userSubId = CustomUserDefaults().getUserId()
    }
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        let endpoint = MyFavoritesAPIEndpoint(subId: userSubId, page: page)
        let favoritesEntities: [FavoriteDTO] = try await requestManager.doAsyncAwaitRequest(apiInfo: endpoint)
        return favoritesEntities.map { apiTransformer.transformFavoriteEntity(entity: $0) }
    }
    
    func addToFavorites(imageId: String) {
        try? requestManager.doAsyncRequest(apiRouter: .favImage(userSubId, imageId))
    }
}
