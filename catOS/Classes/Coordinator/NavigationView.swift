//
//  NavigationView.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import Foundation

enum NavigationView: String, Identifiable {
    case tabsContainer
    case feed
    case breeds
    case profile
    case error
    
    var id: String {
        self.rawValue
    }
}
