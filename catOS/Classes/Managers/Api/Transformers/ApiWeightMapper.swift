//
//  ApiWeightMapper.swift
//  catOS
//
//  Created by rosadiez on 8/2/24.
//

import Foundation

class ApiWeightMapper: Mapper {
    
    func mapValues(_ entity: WeightEntity) -> Weight {
        return Weight(
            imperial: entity.imperial ?? "",
            metric: entity.metric ?? "")
    }
    
}
