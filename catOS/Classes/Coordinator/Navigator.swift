//
//  Navigator.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import SwiftUI

class Navigator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: NavigationView?
    @Published var fullScreenCover: NavigationView?
    
    func push(_ navigationView: NavigationView) {
        path.append(navigationView)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    func presentSheet(_ navigationView: NavigationView) {
        self.sheet = navigationView
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    
    func presentFullScreen(_ navigationView: NavigationView) {
        self.fullScreenCover = navigationView
    }
    
    func dismissFullScreen() {
        self.fullScreenCover = nil
    }
    
    
    @ViewBuilder
    func build(navigationView: NavigationView, _ customParameters: Any...) -> some View {
                    
        switch navigationView {
                
            case .feed:
                let feedViewModel: FeedViewModel = FeedViewModel()
                FeedView(viewModel: feedViewModel)
            case .breeds:
                let breedsViewModel: BreedsViewModel = BreedsViewModel()
                BreedsView(viewModel: breedsViewModel)
            case .profile:
                ProfileView()
        }
        
    }
}
