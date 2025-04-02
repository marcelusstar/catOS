//
//  FavoritesRepository.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol FavoritesRepository {
    func getFavorites(page: Int) async throws -> [Favorite]
    func addToFavorites(imageId: String)
}
