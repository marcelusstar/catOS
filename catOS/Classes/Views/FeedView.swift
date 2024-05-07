//
//  FeedView.swift
//  catOS
//
//  Created by rosadiez on 24/4/24.
//

import Foundation
import SwiftUI

struct FeedView: View {
    
    var viewModel: FeedViewModel
    
    var body: some View {
        List(viewModel.feedImages, id:\.id) { feedImage in
            CardView(feedImage: feedImage)
        }
        .task {
            await viewModel.getFeedImages()
        }
    }
    
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        let feedImages: [FeedImage] = [
            FeedImage(id: "0", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg"),
            FeedImage(id: "1", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg"),
            FeedImage(id: "2", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg")
        
        ]
        
        let viewModel: FeedViewModel = FeedViewModel(feedImages: feedImages)
        
        FeedView(viewModel: viewModel)
    }
}
