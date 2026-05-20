//
//  Navigator.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import SwiftUI

class Navigator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: CatScreens?
    @Published var fullScreenCover: CatScreens?
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
    
    func presentSheet(_ navigationView: CatScreens) {
        self.sheet = navigationView
    }
    
    func dismissSheet() {
        self.sheet = nil
    }    
    
    func presentFullScreen(_ navigationView: CatScreens) {
        self.fullScreenCover = navigationView
    }
    
    func dismissFullScreen() {
        self.fullScreenCover = nil
    }
}
