//
//  CustomUserDefaults.swift
//  catOS
//
//  Created by rosadiez on 21/6/24.
//

import Foundation
import UIKit

struct CustomUserDefaults {
    static let userKey = "userIdKey"

    func hasUserId() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.string(forKey: CustomUserDefaults.userKey) != nil {
            return true
        }
        
        return false
    }
    
    func getUserId() -> String {
        
        #if DEBUG
            return "soyelctangana"
        #endif
        
        let defaults = UserDefaults.standard
        return defaults.string(forKey: CustomUserDefaults.userKey) ?? ""
    }
    
    func generateUserId() {
        
        let defaults = UserDefaults.standard
        
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            defaults.setValue(uuid, forKey: CustomUserDefaults.userKey)
            return
        }
        
        let secondsStamp = Int(Date().timeIntervalSince1970)
        let userId = "catOS\(String(secondsStamp))"
        defaults.setValue(userId, forKey: CustomUserDefaults.userKey)
    }
}
