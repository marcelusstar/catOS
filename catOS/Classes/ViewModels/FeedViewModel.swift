//
//  FeedViewModel.swift
//  catOS
//
//  Created by rosadiez on 16/4/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    private var feedImages: [FeedImage] = []
    @Published var error: CatError? = nil
    @Published var cardViewModels: [CardViewModel] = []
    @Published var loadingData: Bool = false
    private var paginationFeedImages: Int = 0
    
    init(feedImages: [FeedImage]) {
        self.feedImages = feedImages
        self.cardViewModels = feedImages.map { CardViewModel($0) }
    }
    
    init() {
        
    }
    
    @MainActor
    func getFeedImages() async {
        do {
            guard cardViewModels.isEmpty else {
                return
            }
            
            loadingData = true
            
            feedImages = try await ApiManager.shared.getFeedImages(page: paginationFeedImages)
            paginationFeedImages += 1
            cardViewModels = feedImages.map { CardViewModel($0) }
        }
        catch {
            self.error = error as? CatError
        }
        
        loadingData = false
    }
    
    fileprivate func removeLastImageViewed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + CardViewModel.disappearanceAnimationTime + 0.1, execute: {
            self.cardViewModels.removeLast()
            
            Task { 
                if (self.cardViewModels.isEmpty) {
                    await self.getFeedImages()
                }
            }
        })
    }
    
    func like() {
        self.cardViewModels.last?.like()
        removeLastImageViewed()
    }
    
    func dislike() {
        self.cardViewModels.last?.dislike()
        removeLastImageViewed()
    }
    
    @MainActor
    func addToFavs() {
        self.cardViewModels.last?.addToFavs()
        removeLastImageViewed()
    }
}
