//
//  Navigator.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import SwiftUI

class Navigator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var selectedTab: Tab = .feed
    
    func push(_ navigationView: CatScreens) {
        path.append(navigationView)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
