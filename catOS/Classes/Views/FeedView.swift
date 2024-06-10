//
//  FeedView.swift
//  catOS
//
//  Created by rosadiez on 24/4/24.
//

import Foundation
import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        VStack {
            cards
            buttons
                
        }
        .errorAlert($viewModel.error)
        .task {
            await viewModel.getFeedImages()
        }
    }
    
    var cards: some View {
        ZStack {
            ForEach(viewModel.feedImages, id: \.id) { feedImage in
                CardView(viewModel: CardViewModel(feedImage))
            }
        }
        .padding(20.0)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity)
    }
    
    var buttons: some View {
        HStack(spacing: 25.0) {
            Spacer()
            ButtonGradientOutline(
                action: {
                    
                },
                iconName: "hand.thumbsdown.fill",
                colors: [Color.red])
            
            ButtonGradientOutline(
                action: {
                    
                },
                iconName: "heart.fill",
                colors: [Color.purple])
            
            ButtonGradientOutline(
                action: {
                    
                },
                iconName: "hand.thumbsup.fill",
                colors: [Color.green])
            Spacer()
        }
        .padding(
            EdgeInsets(top: 10.0,
                       leading: 0.0,
                       bottom: 30.0,
                       trailing: 0.0))
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
