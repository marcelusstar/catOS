//
//  CardViewModel.swift
//  catOS
//
//  Created by rosadiez on 24/4/24.
//

import Foundation

@Observable
class CardViewModel {
    
    var feedImageData: FeedImage
    
    init(feedImageData: FeedImage) {
        self.feedImageData = feedImageData
    }
    
}
