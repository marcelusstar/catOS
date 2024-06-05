//
//  FeedViewModel.swift
//  catOS
//
//  Created by rosadiez on 16/4/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var feedImages: [FeedImage] = []
    @Published var error: CatError? = nil
    
    init(feedImages: [FeedImage]) {
        self.feedImages = feedImages
    }
    
    init() {
        
    }
    
    @MainActor
    func getFeedImages() async {
        do {
            guard feedImages.isEmpty else {
                return
            }
            
            feedImages = try await ApiManager.shared.getFeedImages(page: 1)
        }
        catch {
            self.error = error as? CatError
        }
        
        
    }
}
