//
//  ErrorViewModel.swift
//  catOS
//
//  Created by rosadiez on 29/5/24.
//

import Foundation

class ErrorViewModel: ObservableObject {
    
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func close() {
        
    }
    
}
