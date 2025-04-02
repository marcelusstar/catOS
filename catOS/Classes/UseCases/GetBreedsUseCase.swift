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
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    func execute() async throws -> [Breed] {
        try await apiManager.getBreeds()
    }
}
