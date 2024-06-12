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
    
    init() {
        
    }
    
    init(favorites: [Favorite]) {
        self.favorites = favorites
    }
    
    @MainActor
    func getFavorites() async {
        do {
            favorites = try await ApiManager.shared.getFavorites(page: 0)
        }
        catch {
            self.error = error as? CatError
        }
    }
    
}
