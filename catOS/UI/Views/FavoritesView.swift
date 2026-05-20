//
//  FavoritesView.swift
//  catOS
//
//  Created by rosadiez on 12/6/24.
//

import Foundation
import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        List(viewModel.favorites, id:\.id) { favorite in
            CardView(viewModel: CardViewModel(favorite.image))
                .aspectRatio(0.7, contentMode: .fit)
        }
        .navigationTitle(String(localized: "tab_title.favs"))
        .refreshable {
            await viewModel.getFavorites(forceRefresh: true)
        }
        .errorAlert($viewModel.error)
        .loading($viewModel.loadingData)
        .task {
            await viewModel.getFavorites()
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
