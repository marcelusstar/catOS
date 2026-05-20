//
//  ImagesRepositoryDefault.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

struct ImagesRepositoryDefault: ImagesRepository {
    
    let requestManager: RequestManagerProtocol
    let apiTransformer: ApiTransformer
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         apiTransformer: ApiTransformer = ApiTransformer()) {
        self.requestManager = requestManager
        self.apiTransformer = apiTransformer
    }
    
    private func getImages(limit: Int, breedId: String) async throws -> [FeedImage] {
        let endpoint = FeedImagesAPIEndpoint(limit: limit, breedId: breedId)
        let feedImagesEntities: [FeedImageDTO] = try await requestManager.doAsyncAwaitRequest(apiInfo: endpoint)
        
        return feedImagesEntities.map { apiTransformer.transformFeedImageEntity(entity: $0) }
    }
    
    func getFeedImages(limit: Int) async throws -> [FeedImage] {
        return try await getImages(limit: limit, breedId: "")
    }
}
