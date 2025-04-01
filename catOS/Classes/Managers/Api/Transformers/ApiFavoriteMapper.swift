//
//  ApiFavoriteMapper.swift
//  catOS
//
//  Created by rosadiez on 12/6/24.
//

import Foundation

class ApiFavoriteMapper: Mapper {
    
    private static let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df
    }()
    
    func mapValues(_ entity: FavoriteEntity) -> Favorite {

        let createdAt: Date = Self.formatter.date(from: entity.createdAt ?? "") ?? Date()
        let image = ApiFeedImageMapper().mapValues(entity.image)
        
        return Favorite(id: entity.id,
                        userId: entity.userId,
                        imageId: entity.imageId,
                        subId: entity.subId,
                        createdAt: createdAt,
                        image: image)
    }
    
}
