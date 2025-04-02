//
//  AddToFavoritesUseCase.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol AddToFavoritesUseCase {
    func execute(imageId: String)
}

struct AddToFavoritesUseCaseDefault: AddToFavoritesUseCase {
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository = FavoritesRepositoryDefault()) {
        self.repository = repository
    }

    func execute(imageId: String) {
        repository.addToFavorites(imageId: imageId)
    }
}
