//
//  TabsView.swift
//  catOS
//
//  Created by rosadiez on 28/5/24.
//

import Foundation
import SwiftUI

enum Tab: Hashable {
    case feed
    case breeds
    case profile
}

struct TabsView: View {
    
    @State var selectedTab: Tab = .feed
    private var coordinator: Coordinator = Coordinator.shared

    
    var body: some View {
        TabView(selection: $selectedTab) {
            coordinator.buildFeed()
                .tabItem {
                    Label("Home", systemImage: "cat")
                }
                .id(Tab.feed)
            
            coordinator.buildBreeds()
                .tabItem {
                    Label("Breeds", systemImage: "cat")
                }
                .id(Tab.breeds)
            
            coordinator.buildProfile()
                .tabItem {
                    Label("Profile", systemImage: "cat")
                }
                .id(Tab.profile)
        }
    }
}

#Preview {
    TabsView()
}


