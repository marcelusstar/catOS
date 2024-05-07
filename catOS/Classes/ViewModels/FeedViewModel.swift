//
//  FeedViewModel.swift
//  catOS
//
//  Created by rosadiez on 16/4/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var feedImages: [FeedImage] = []
    
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
