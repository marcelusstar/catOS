//
//  BreedListItemViewModel.swift
//  catOS
//
//  Created by rosadiez on 9/9/24.
//

import Foundation

class BreedListItemViewModel: ObservableObject {
    
    var breed: Breed
    
    var imageURL: URL? {
        let urlString = "\(ApiRouter.baseCdnUrlImages)/\(breed.referenceImageID).jpg"
        
        return URL(string: urlString)
    }
    
    init(breed: Breed) {
        self.breed = breed
    }
    
}
