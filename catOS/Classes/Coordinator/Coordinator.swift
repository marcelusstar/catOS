//
//  Coordinator.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import Foundation
import SwiftUI
    
class Coordinator {
    
    static let shared: Coordinator = Coordinator()
    
    var navigator: Navigator = Navigator()
    
    func buildTabsView() -> some View {
        navigator.build(navigationView: .tabsContainer)
    }
    
    func buildFeed() -> some View {
        navigator.build(navigationView: .feed)
    }

    func buildBreeds() -> some View {
        navigator.build(navigationView: .breeds)
    }
    
    func buildProfile() -> some View {
        navigator.build(navigationView: .profile)
    }
    
    func showError(message: String) {
        navigator.presentFullScreen(.error)
    }
    
}
