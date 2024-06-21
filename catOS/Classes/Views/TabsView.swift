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
    case favorites
}

struct TabsView: View {
    
    @State var selectedTab: Tab = .feed
    @StateObject private var coordinator: Coordinator = Coordinator()

    
    var body: some View {
        TabView(selection: $selectedTab) {
            coordinator.buildFeed()
                .tabItem {
                    Label(String(localized: "tab_title.home"), systemImage: "cat")
                }
                .tag(Tab.feed)
            
            coordinator.buildBreeds()
                .tabItem {
                    Label(String(localized: "tab_title.breeds"), systemImage: "magnifyingglass")
                }
                .tag(Tab.breeds)
            
            coordinator.buildFavorites()
                .tabItem {
                    Label(String(localized: "tab_title.favs"), systemImage: "heart.fill")
                }
                .tag(Tab.favorites)
        }
        .onChange(of: selectedTab) { newValue in
            print(newValue)
        }
    }
}

#Preview {
    TabsView()
}


