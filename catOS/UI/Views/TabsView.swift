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
    
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        TabView(selection: $navigator.selectedTab) {
            CatScreens.feed.view()
                .tabItem {
                    Label(String(localized: "tab_title.home"), systemImage: "cat")
                }
                .tag(Tab.feed)
            
            CatScreens.breeds.view()
                .tabItem {
                    Label(String(localized: "tab_title.breeds"), systemImage: "magnifyingglass")
                }
                .tag(Tab.breeds)
            
            CatScreens.favorites.view()
                .tabItem {
                    Label(String(localized: "tab_title.favs"), systemImage: "heart.fill")
                }
                .tag(Tab.favorites)
        }
        .onChange(of: navigator.selectedTab) { newValue in
            print(newValue)
        }
    }
}

#Preview {
    TabsView()
}


