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
    @State var switchAspectFit: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            
            GeometryReader { geo in
                AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: switchAspectFit ? .fit : .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                } placeholder: {
                    ProgressView()
                            .scaleEffect(2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                    
                }
            }

            Button(action: {
                switchAspectFit.toggle()
            }, label: {
                Image(systemName:
                        switchAspectFit ? "arrow.down.backward.and.arrow.up.forward.circle" : "arrow.up.right.and.arrow.down.left.circle")
                .foregroundGradient(colors: [.orange])
            })
            .font(.system(size: 35, weight: .regular))
            .padding(10)
            

            
              
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.aspectRatio(0.7, contentMode: .fit)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(8)
        .opacity(viewModel.shouldDisappearAnimation ? 0 : 1)
        .animation(.smooth(duration: CardViewModel.disappearanceAnimationTime), value: viewModel.shouldDisappearAnimation)
        
        
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
