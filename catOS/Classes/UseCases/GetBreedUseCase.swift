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
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    func execute(id: String) async throws -> Breed {
        try await apiManager.getBreed(id: id)
    }
}
