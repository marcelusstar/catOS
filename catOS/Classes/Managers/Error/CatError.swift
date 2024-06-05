//
//  CatError.swift
//  catOS
//
//  Created by rosadiez on 18/3/24.
//

import Foundation

enum CatError: Error, LocalizedError {
    case noInternet
    case internetConnection
    case serverError
    case badRequest
    case genericError
    
    var errorDescription: String? {
        switch self {
            
        case .noInternet:
            "No internet connection"
        case .serverError:
            "Server error connection"
        case .badRequest:
            "Bad request"
        case .internetConnection:
            "Problem with internet connection"
        case .genericError:
            "Unknown error"
        }
    }
    
    var failureReason: String? {
        
        switch self {
            
        case .noInternet:
            "You are not connected to internet. Check settings."
        case .serverError:
            "There was some problem connecting to the server. Try again."
        case .badRequest:
            "Wrong or missing parameters for that server request."
        case .internetConnection:
            "There was a problem with internet connection. Check settings"
        case .genericError:
            "Something was wrong, please try again later."
        }
        
    }
}
