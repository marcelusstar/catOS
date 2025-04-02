//
//  GetBreedUseCase.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol GetBreedUseCase {
    func execute(id: String) async throws -> Breed
}

struct GetBreedUseCaseDefault: GetBreedUseCase {
    private let repository: BreedsRepository
    
    init(repository: BreedsRepository = BreedsRepositoryDefault()) {
        self.repository = repository
    }
    
    func execute(id: String) async throws -> Breed {
        try await repository.getBreed(id: id)
    }
}
