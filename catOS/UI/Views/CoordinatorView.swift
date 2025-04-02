//
//  CoordinatorView.swift
//  catOS
//
//  Created by rosadiez on 22/5/24.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator: Coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.navigator.path) {
            coordinator.navigator.build(navigationView: .feed)
                .navigationDestination(for: NavigationView.self) { navigationView in
                    coordinator.navigator.build(navigationView: navigationView)
                }
                .sheet(item: $coordinator.navigator.sheet) { navigationView in
                    coordinator.navigator.build(navigationView: navigationView)
                }
                .fullScreenCover(item: $coordinator.navigator.fullScreenCover) {
                    navigationView in
                    coordinator.navigator.build(navigationView: navigationView)
                }
        }
        .environmentObject(coordinator)
    }
    
}

#Preview {
    CoordinatorView()
}
