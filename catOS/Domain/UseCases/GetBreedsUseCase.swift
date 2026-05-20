//
//  GetBreedsUseCase.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol GetBreedsUseCase {
    func execute() async throws -> [Breed]
}

struct GetBreedsUseCaseDefault: GetBreedsUseCase {
    private let repository: BreedsRepository
    
    init(repository: BreedsRepository = BreedsRepositoryDefault()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Breed] {
        try await repository.getBreeds(limit: 100)
    }
}
