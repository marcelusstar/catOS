//
//  ApiCategoryMapper.swift
//  catOS
//
//  Created by rosadiez on 15/2/24.
//

import Foundation

import Foundation

class ApiCategoryMapper: Mapper {
    
    func mapValues(_ entity: CategoryEntity) -> Category {
        return Category(
            id: entity.id ?? -1,
            name: entity.name ?? "")
    }
    
}
