//
//  FeedViewModel.swift
//  catOS
//
//  Created by rosadiez on 16/4/24.
//

import Foundation

class FeedViewModel: BaseViewModel {
    private(set) var feedImages: [FeedImage] = []
    @Published var error: CatError? = nil
    @Published var cardViewModels: [CardViewModel] = []
    @Published var loadingData: Bool = false
    var visibleReloadButton: Bool = false
    private(set) var paginationFeedImages: Int = 0

    @MainActor
    func getFeedImages() async {
        do {
            guard cardViewModels.isEmpty else {
                return
            }
            
            loadingData = true
            
            feedImages = try await apiManager.getFeedImages(page: paginationFeedImages)
            paginationFeedImages += 1
            cardViewModels = feedImages.map { CardViewModel($0) }
            visibleReloadButton = false
        }
        catch {
            handleError(error)
        }
        
        loadingData = false
    }
    
    private func handleError(_ error: Error) {
        if let catError = error as? CatError {
            self.error = catError
        } else {
            self.error = CatError.unknown
        }
        visibleReloadButton = true
    }
    
    fileprivate func removeLastImageViewed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + CardViewModel.disappearanceAnimationTime + 0.1) { [weak self] in
            guard let self = self else { return }
            
            if !self.cardViewModels.isEmpty {
                self.cardViewModels.removeLast()
            }
            
            
            if self.cardViewModels.isEmpty {
                Task { @MainActor in
                    await self.getFeedImages()
                }
            }
        }
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
