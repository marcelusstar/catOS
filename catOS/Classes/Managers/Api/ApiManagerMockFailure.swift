//
//  ApiManagerMock.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

struct ApiManagerMockFailure: ApiManagerProtocol {
    
    static let shared: ApiManagerProtocol = ApiManagerMockFailure()
    
    func getFeedImages(page: Int) async throws -> [FeedImage] {
        throw CatError.genericError
    }
    
    func getBreed(id: String) async throws -> Breed {
        throw CatError.genericError
    }
    
    func getBreeds() async throws -> [Breed] {
        throw CatError.genericError
    }
    
    func getFavorites(page: Int) async throws -> [Favorite] {
        throw CatError.genericError
    }
    
    func addToFavorites(imageId: String) {
        return
    }
    
    func likeImage(imageId: String) {
        return
    }
    
    func dislikeImage(imageId: String) {
        return
    }
    
    
}
