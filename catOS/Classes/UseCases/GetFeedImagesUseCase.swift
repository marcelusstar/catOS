//
//  GetFeedImagesUseCase.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol GetFeedImagesUseCase {
    func execute(limit: Int) async throws -> [FeedImage]
}

struct GetFeedImagesUseCaseDefault: GetFeedImagesUseCase {
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    func execute(limit: Int) async throws -> [FeedImage] {
        try await apiManager.getFeedImages(limit: limit)
    }
}
