//
//  VoteResultEntity.swift
//  catOS
//
//  Created by rosadiez on 29/1/24.
//

import Foundation

struct VoteResultEntity: Codable {
    
    let message: String
    let id: Int
    let image_id: String
    let sub_id: String
    let value: Int
    let country_code: String
    
}
