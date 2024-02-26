//
//  ImageEntity.swift
//  catOS
//
//  Created by rosadiez on 29/1/24.
//

import Foundation

struct FeedImageEntity: Codable {
    
    let id: String
    let breeds: [BreedEntity]?
    let categories: [CategoryEntity]?
    let height: Int?
    let width: Int?
    let url: String?
}
