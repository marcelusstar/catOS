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
    var switchAspectFit: Bool = false
        
    static let disappearanceAnimationTime: Double = 0.3
    
    let addToFavoritesUseCase: AddToFavoritesUseCase
    let voteImageUseCase: VoteImageUseCase
    
    init(addToFavoritesUseCase: AddToFavoritesUseCase = AddToFavoritesUseCaseDefault(),
         voteImageUseCase: VoteImageUseCase = VoteImageUseCaseDefault(),
         _ feedImageData: FeedImage) {
            
        self.addToFavoritesUseCase = addToFavoritesUseCase
        self.voteImageUseCase = voteImageUseCase
        
        self.feedImageData = feedImageData
        self.imageUrl = feedImageData.url
        shouldDisappearAnimation = false
    }
    
    func like() {
        voteImageUseCase.execute(imageId: feedImageData.id, like: true)
        shouldDisappearAnimation.toggle()
    }
    
    func dislike() {
        voteImageUseCase.execute(imageId: feedImageData.id, like: false)
        shouldDisappearAnimation.toggle()
    }
    
    @MainActor
    func addToFavs()  {
        addToFavoritesUseCase.execute(imageId: feedImageData.id)
        shouldDisappearAnimation.toggle()
    }
    
}
