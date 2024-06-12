//
//  NavigationView.swift
//  catOS
//
//  Created by rosadiez on 21/5/24.
//

import Foundation

enum NavigationView: String, Identifiable {
    case feed
    case breeds
    case profile
    case favorites
    
    var id: String {
        self.rawValue
    }
}
