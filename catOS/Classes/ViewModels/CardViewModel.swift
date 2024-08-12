//
//  CardViewModel.swift
//  catOS
//
//  Created by rosadiez on 24/4/24.
//

import Foundation

class CardViewModel: BaseViewModel {
    
    let id = UUID()
    
    var feedImageData: FeedImage
    @Published var imageUrl: String
    @Published var shouldDisappearAnimation: Bool
    var switchAspectFit: Bool = false
        
    static let disappearanceAnimationTime: Double = 0.3
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared, _ feedImageData: FeedImage) {
            
        self.feedImageData = feedImageData
        self.imageUrl = feedImageData.url
        shouldDisappearAnimation = false
        
        super.init(apiManager: apiManager)
    }
    
    func like() {
        apiManager.likeImage(imageId: feedImageData.id)
        shouldDisappearAnimation.toggle()
    }
    
    func dislike() {
        apiManager.dislikeImage(imageId: feedImageData.id)
        shouldDisappearAnimation.toggle()
    }
    
    @MainActor
    func addToFavs()  {
        apiManager.addToFavorites(imageId: feedImageData.id)
        shouldDisappearAnimation.toggle()
    }
    
}
