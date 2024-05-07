//
//  FeedViewModel.swift
//  catOS
//
//  Created by rosadiez on 16/4/24.
//

import Foundation

@Observable
class FeedViewModel {
    var feedImages: [FeedImage] = []
    
    init(feedImages: [FeedImage]) {
        self.feedImages = feedImages
    }
    
    init() {
        
    }
    
    func getFeedImages() async {
        do {
            feedImages = try await ApiManager.shared.getFeedImages(page: 1)
        }
        catch {
            ErrorManager.shared.process(error as! CatError)
        }
        
        
    }
}
