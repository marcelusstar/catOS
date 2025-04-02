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
            .navigationTitle(String(localized: "tab_title.favs"))
            .errorAlert($viewModel.error)
            .loading($viewModel.loadingData)
            .task {
                await viewModel.getFavorites()
            }
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = FavoritesRepositoryMock()
        let useCase = GetFavoritesUseCaseDefault(repository: repository)
        let viewModel = FavoritesViewModel(getFavoritesUseCase: useCase)
        FavoritesView(viewModel:  viewModel)
    }
}
