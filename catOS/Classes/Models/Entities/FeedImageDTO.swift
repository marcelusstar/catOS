//
//  ImageEntity.swift
//  catOS
//
//  Created by rosadiez on 29/1/24.
//

import Foundation

struct FeedImageDTO: Codable {
    
    let id: String
    let breeds: [BreedDTO]?
    let categories: [CategoryDTO]?
    let height: Int?
    let width: Int?
    let url: String?
}
