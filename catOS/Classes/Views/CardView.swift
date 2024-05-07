//
//  CardView.swift
//  catOS
//
//  Created by rosadiez on 16/4/24.
//

import Foundation
import SwiftUI


struct CardView: View {
    
    @ObservedObject var viewModel: CardViewModel
    
    let cardGradient = Gradient(colors: [Color.black.opacity(0.3), Color.clear])
    
    var body: some View {
        ZStack(alignment:  .topLeading, content: {
            
            GeometryReader { geo in
                AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                } placeholder: {
                    ProgressView()
                            .scaleEffect(2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
            }
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(0.7, contentMode: .fit)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let feedImage: FeedImage = FeedImage(id: "0", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg"
        /*"https://cdn2.thecatapi.com/images/MTcyMDExMw.jpg"*/
         /*"https://cdn2.thecatapi.com/images/yUhSG7Vv7.jpg"*/
         /*"https://i.giphy.com/2yLNN4wTy7Zr8JSXHB.webp"*/
        )
        CardView(viewModel: CardViewModel(feedImage))
    }
}
