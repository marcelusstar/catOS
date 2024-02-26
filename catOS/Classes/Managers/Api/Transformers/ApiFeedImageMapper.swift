//
//  ApiFeedImageMapper.swift
//  catOS
//
//  Created by rosadiez on 15/2/24.
//

import Foundation

class ApiFeedImageMapper: Mapper {
    
    let apiBreedMapper: ApiBreedMapper = ApiBreedMapper()
    
    func mapValues(_ entity: FeedImageEntity) -> FeedImage {
        
        var breeds: [Breed] = []
        
        if let breedsEntities = entity.breeds {
            breeds = breedsEntities.map { apiBreedMapper.mapValues($0) }
        }
        
        var categories: [Category] = []
        if let categoriesEntities = entity.categories {
            categories = entity.categories!.map { ApiCategoryMapper().mapValues($0) }
        }
        
        return FeedImage(id: entity.id,
                  breeds: breeds,
                  categories: categories,
                  height: entity.height ?? 0,
                  width: entity.width ?? 0,
                  url: entity.url ?? "")
    }
}
