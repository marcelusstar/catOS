//
//  VoteImageUseCase.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol VoteImageUseCase {
    func execute(imageId: String, like: Bool)
}

struct VoteImageUseCaseDefault: VoteImageUseCase {
    
    private let repository: VoteRepository
    
    init(repository: VoteRepository = VoteRepositoryDefault()) {
        self.repository = repository
    }
    
    func execute(imageId: String, like: Bool) {
        repository.voteImage(imageId: imageId, like: like)
    }
}
