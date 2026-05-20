//
//  BreedsRepository.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol BreedsRepository {
    func getBreeds(limit: Int) async throws -> [Breed]
    func getBreed(id: String) async throws -> Breed
}
