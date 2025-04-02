//
//  ApiManagerProtocol.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

protocol ApiManagerProtocol {
    
    func getFavorites(page: Int) async throws -> [Favorite]
    
    func addToFavorites(imageId: String)
    
    func likeImage(imageId: String)
    
    func dislikeImage(imageId: String)
    
}
