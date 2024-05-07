//
//  CardViewModel.swift
//  catOS
//
//  Created by rosadiez on 24/4/24.
//

import Foundation

class CardViewModel: ObservableObject {
    
    var feedImageData: FeedImage
    @Published var imageUrl: String
    
    init(_ feedImageData: FeedImage) {
        self.feedImageData = feedImageData
        self.imageUrl = feedImageData.url
    }
    
}
