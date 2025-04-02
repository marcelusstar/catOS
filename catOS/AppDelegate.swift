//
//  AppDelegate.swift
//  catOS
//
//  Created by rosadiez on 21/6/24.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let customUserDefaults: CustomUserDefaults = CustomUserDefaults()
        
        if !customUserDefaults.hasUserId() {
            customUserDefaults.generateUserId()
        }
        
        print("didFinishLaunchingWithOptions")
        
        return true
    }
    
}
