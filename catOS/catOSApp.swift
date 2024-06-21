//
//  catOSApp.swift
//  catOS
//
//

import SwiftUI

@main
struct catOSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
