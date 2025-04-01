//
//  ApiTransformer.swift
//  catOS
//
//  Created by rosadiez on 8/2/24.
//

import Foundation

struct ApiTransformer {
    
    let apiBreedMapper: ApiBreedMapper
    let apiFeedImageMapper: ApiFeedImageMapper
    let apiFavoriteMapper: ApiFavoriteMapper
    
    init(apiBreedMapper: ApiBreedMapper = ApiBreedMapper(),
         apiFeedImageMapper: ApiFeedImageMapper = ApiFeedImageMapper(),
         apiFavoriteMapper: ApiFavoriteMapper = ApiFavoriteMapper()) {
        self.apiBreedMapper = apiBreedMapper
        self.apiFeedImageMapper = apiFeedImageMapper
        self.apiFavoriteMapper = apiFavoriteMapper
    }
    
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
