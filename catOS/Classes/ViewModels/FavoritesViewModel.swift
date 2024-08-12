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
    
    let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    @MainActor
    func getFavorites() async {
        
        loadingData = true
        
        do {
            favorites = try await apiManager.getFavorites(page: 0)
        }
        catch {
            self.error = error as? CatError
        }
        
        loadingData = false
    }
    
}
