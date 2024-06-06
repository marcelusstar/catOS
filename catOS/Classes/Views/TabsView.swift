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
    @StateObject private var coordinator: Coordinator = Coordinator()

    
    var body: some View {
        TabView(selection: $selectedTab) {
            coordinator.buildFeed()
                .tabItem {
                    Label("Home", systemImage: "cat")
                }
                .tag(Tab.feed)
            
            coordinator.buildBreeds()
                .tabItem {
                    Label("Breeds", systemImage: "cat")
                }
                .tag(Tab.breeds)
            
            coordinator.buildProfile()
                .tabItem {
                    Label("Profile", systemImage: "cat")
                }
                .tag(Tab.profile)
        }
        .onChange(of: selectedTab) { newValue in
            print(newValue)
        }
    }
}

#Preview {
    TabsView()
}


