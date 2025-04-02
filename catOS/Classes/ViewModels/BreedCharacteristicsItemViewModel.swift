//
//  BreedCharacteristicsItemViewModel.swift
//  catOS
//
//  Created by rosadiez on 16/9/24.
//

import Foundation

class BreedCharacteristicsItemViewModel: ObservableObject {
    
    @Published var name: String
    @Published var score: Int
    var maxScore = 5
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
}
