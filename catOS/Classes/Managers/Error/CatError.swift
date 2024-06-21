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
            String(localized: "error.no_internet")
        case .serverError:
            String(localized: "error.server_error")
        case .badRequest:
            String(localized: "error.bad_request")
        case .internetConnection:
            String(localized: "error.internet_connection")
        case .genericError:
            String(localized: "error.generic_error")
        }
    }
    
    var failureReason: String? {
        
        switch self {
            
        case .noInternet:
            String(localized: "error.no_internet_description")
        case .serverError:
            String(localized: "error.server_error_description")
        case .badRequest:
            String(localized: "error.bad_request_description")
        case .internetConnection:
            String(localized: "error.internet_connection_description")
        case .genericError:
            String(localized: "error.generic_error_description")
        }
        
    }
}
