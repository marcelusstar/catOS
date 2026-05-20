//
//  CatScreens.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import SwiftUI

enum CatScreens {
    case feed
    case breeds
    case favorites
    case breedDetails(Breed)
    
    @MainActor @ViewBuilder
    func view() -> some View {
        switch self {
        case .feed:
            FeedView()
        case .breeds:
            BreedsView()
        case .favorites:
            FavoritesView()
        case .breedDetails(let breed):
            BreedDetailedView(breed: breed)
        }
    }
}
