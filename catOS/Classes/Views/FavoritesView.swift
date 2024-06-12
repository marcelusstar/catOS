//
//  FavoritesView.swift
//  catOS
//
//  Created by rosadiez on 12/6/24.
//

import Foundation
import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            
            List(viewModel.favorites, id:\.id) { favorite in
                CardView(viewModel: CardViewModel(favorite.image))
                    .aspectRatio(0.7, contentMode: .fit)
                
                
            }
            .errorAlert($viewModel.error)
            .task {
                await viewModel.getFavorites()
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        
        let feedImage1: FeedImage = FeedImage(id: "0", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg")
        let favorite1: Favorite = Favorite(id: 0, userId: "ctangana", imageId: "0", subId: "subId", createdAt: Date(), image: feedImage1)
        
        let feedImage2 = FeedImage(id: "1", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/der.jpg")
        let favorite2: Favorite = Favorite(id: 1, userId: "ctangana", imageId: "1", subId: "subId", createdAt: Date(), image: feedImage2)
        
        
        FavoritesView(viewModel: FavoritesViewModel(favorites: [favorite1, favorite2]))
    }
}
