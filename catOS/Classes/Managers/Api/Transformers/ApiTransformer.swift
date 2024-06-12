//
//  ApiTransformer.swift
//  catOS
//
//  Created by rosadiez on 8/2/24.
//

import Foundation


class ApiTransformer {
    
    static let shared: ApiTransformer = {
        let instance = ApiTransformer()
        return instance
    }()
    
    let apiBreedMapper: ApiBreedMapper = ApiBreedMapper.shared
    let apiFeedImageMapper: ApiFeedImageMapper = ApiFeedImageMapper()
    let apiFavoriteMapper: ApiFavoriteMapper = ApiFavoriteMapper()
    
    func transformBreedEntity(entity: BreedEntity) -> Breed {
        apiBreedMapper.mapValues(entity)
    }
    
    func transformFeedImageEntity(entity: FeedImageEntity) -> FeedImage {
        apiFeedImageMapper.mapValues(entity)
    }
    
    func transformFavoriteEntity(entity: FavoriteEntity) -> Favorite {
        apiFavoriteMapper.mapValues(entity)
    }
    
}
