//
//  CoordinatorView.swift
//  catOS
//
//  Created by rosadiez on 22/5/24.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator: Navigator = Coordinator.shared.navigator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(navigationView: .tabsContainer)
                .navigationDestination(for: NavigationView.self) { navigationView in
                    coordinator.build(navigationView: navigationView)
                }
                .sheet(item: $coordinator.sheet) { navigationView in
                    coordinator.build(navigationView: navigationView)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) {
                    navigationView in
                    coordinator.build(navigationView: navigationView)
                }
        }
        .environmentObject(coordinator)
    }
    
}

#Preview {
    CoordinatorView()
}
