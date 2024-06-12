//
//  Coordinator.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import Foundation
import SwiftUI
    
class Coordinator: ObservableObject {
    
    var navigator: Navigator = Navigator()
    
    func buildFeed() -> some View {
        navigator.build(navigationView: .feed)
    }

    func buildBreeds() -> some View {
        navigator.build(navigationView: .breeds)
    }
    
    func buildProfile() -> some View {
        navigator.build(navigationView: .profile)
    }
    
    func buildFavorites() -> some View {
        navigator.build(navigationView: .favorites)
    }
    
}
