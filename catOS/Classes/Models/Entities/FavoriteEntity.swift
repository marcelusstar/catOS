//
//  FavoriteEntity.swift
//  catOS
//
//  Created by rosadiez on 12/6/24.
//

import Foundation

struct FavoriteEntity: Codable {
    let id: Int
    let userId: String
    let imageId: String
    let subId: String
    let createdAt: String?
    let image: FeedImageEntity

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case imageId = "image_id"
        case subId = "sub_id"
        case createdAt = "created_at"
        case image
    }
}
