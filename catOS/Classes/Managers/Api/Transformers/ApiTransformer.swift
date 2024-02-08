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
    
    let apiBreedMapper: ApiBreedMapper = ApiBreedMapper()
    
    func transformBreedEntity(entity: BreedEntity) -> Breed {
        apiBreedMapper.map(entity)
    }
    
}
