//
//  BreedsRepository.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol BreedsRepository {
    func getBreeds() async throws -> [Breed]
    func getBreed(id: String) async throws -> Breed
}
