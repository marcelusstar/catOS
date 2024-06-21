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
        .loading($viewModel.loadingData)
        .task {
            await viewModel.getFeedImages()
        }
    }
    
    var cards: some View {
        ZStack {
            ForEach(viewModel.cardViewModels, id: \.id) { cardViewModel in
                CardView(viewModel: cardViewModel)
                    
            }
            
            ButtonGradientOutline(
                action: {
                    Task {
                        await viewModel.getFeedImages()
                    }
                },
                iconName: "arrow.circlepath",
                colors: [Color.yellow])
            .opacity(viewModel.visibleReloadButton ? 1.0 : 0.0)
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
                    viewModel.dislike()
                },
                iconName: "hand.thumbsdown.fill",
                colors: [Color.red])
            
            ButtonGradientOutline(
                action: {
                    viewModel.addToFavs()
                },
                iconName: "heart.fill",
                colors: [Color.purple])
            
            ButtonGradientOutline(
                action: {
                    viewModel.like()
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
            FeedImage(id: "1", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/der.jpg"),
            FeedImage(id: "2", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/797.png")
        
        ]
        
        let viewModel: FeedViewModel = FeedViewModel(feedImages: feedImages)
        
        FeedView(viewModel: viewModel)
    }
}
