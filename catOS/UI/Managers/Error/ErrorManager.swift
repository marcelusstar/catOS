//
//  ErrorManager.swift
//  catOS
//
//  Created by rosadiez on 18/3/24.
//

import Foundation
import SwiftUI

class ErrorManager: ObservableObject {
    
    static let shared: ErrorManager = ErrorManager()
    
    @Published var error: CatError? = nil
    
    func process(_ error: CatError) {
        
        self.error = error
    }
    
}
