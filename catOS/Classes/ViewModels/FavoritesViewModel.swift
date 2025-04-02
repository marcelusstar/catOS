//
//  FavoritesViewModel.swift
//  catOS
//
//  Created by rosadiez on 12/6/24.
//

import Foundation
import SwiftUI

class FavoritesViewModel: ObservableObject {
    
    @Published var favorites: [Favorite] = []
    @Published var error: CatError?
    @Published var loadingData: Bool = false
    
    let getFavoritesUseCase: GetFavoritesUseCase

    init(getFavoritesUseCase: GetFavoritesUseCase = GetFavoritesUseCaseDefault()) {
        self.getFavoritesUseCase = getFavoritesUseCase
    }
    
    @MainActor
    func getFavorites() async {
        
        loadingData = true
        
        do {
            favorites = try await getFavoritesUseCase.execute(page: 0)
        }
        catch {
            self.error = error as? CatError
        }
        
        loadingData = false
    }
    
}
