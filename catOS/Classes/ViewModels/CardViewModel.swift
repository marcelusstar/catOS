//
//  CardViewModel.swift
//  catOS
//
//  Created by rosadiez on 24/4/24.
//

import Foundation

class CardViewModel: ObservableObject {
    
    let id = UUID()
    
    var feedImageData: FeedImage
    @Published var imageUrl: String
    @Published var shouldDisappearAnimation: Bool
    
    static let disappearanceAnimationTime: Double = 0.3
    
    init(_ feedImageData: FeedImage) {
        self.feedImageData = feedImageData
        self.imageUrl = feedImageData.url
        shouldDisappearAnimation = false
    }
    
    func like() {
        shouldDisappearAnimation.toggle()
    }
    
    func dislike() {
        shouldDisappearAnimation.toggle()
    }
    
    func addToFavs() {
        shouldDisappearAnimation.toggle()
    }
    
}
