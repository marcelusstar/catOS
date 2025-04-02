//
//  GetFavoritesUseCase.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol GetFavoritesUseCase {
    func execute(page: Int) async throws -> [Favorite]
}

struct GetFavoritesUseCaseDefault: GetFavoritesUseCase {
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository = FavoritesRepositoryDefault()) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> [Favorite] {
        try await repository.getFavorites(page: page)
    }
}
