//
//  ApiFavoriteMapper.swift
//  catOS
//
//  Created by rosadiez on 12/6/24.
//

import Foundation

class ApiFavoriteMapper: Mapper {
    
    func mapValues(_ entity: FavoriteEntity) -> Favorite {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        var createdAt: Date
        createdAt = dateFormatter.date(from: entity.createdAt ?? "") ?? Date()
        
        let image = ApiFeedImageMapper().mapValues(entity.image)
        
        return Favorite(id: entity.id,
                        userId: entity.userId,
                        imageId: entity.imageId,
                        subId: entity.subId,
                        createdAt: createdAt,
                        image: image)
    }
    
}
