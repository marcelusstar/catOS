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
    private let repository: ImagesRepository
    
    init(repository: ImagesRepository = ImagesRepositoryDefault()) {
        self.repository = repository
    }
    
    func execute(limit: Int) async throws -> [FeedImage] {
        try await repository.getFeedImages(limit: limit)
    }
}
