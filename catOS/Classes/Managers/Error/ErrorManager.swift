//
//  ErrorManager.swift
//  catOS
//
//  Created by rosadiez on 18/3/24.
//

import Foundation

struct ErrorManager {
    
    static let shared: ErrorManager = ErrorManager()
    
    func process(_ error: CatError) {
        
        switch error {
        
        case .noInternet:
            print("No internet connection")
        case .serverError:
            print("Server error connection")
        case .badRequest:
            print("Wrong or missins parameters for that server request")
        case .internetConnection:
            print("There was a problem with internet connection")
        case .genericError:
            print("Unknown error")
        }
        
    }
    
}
