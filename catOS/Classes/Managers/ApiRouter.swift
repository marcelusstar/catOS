//
//  ApiRouter.swift
//  catOS
//
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

enum ApiRouter {
        
    case randomImage
    
    var baseUrl: String { "https://api.thecatapi.com/v1/" }
    
    var path: String {
        switch self {
            
        case .randomImage:
            "\(baseUrl)images/search"
        }
    }

    var method: HTTPMethod {
        switch self {
            
        case .randomImage:
            return HTTPMethod.get
        }
    }
        
    var headers: [String: String] {
        
        var commonHeaders: [String: String] = [:]
        
        commonHeaders["cache-control"] = "no-cache"
        commonHeaders["Accept"] = "application/json"
        commonHeaders["Content-type"] = "application/x-www-form-urlencoded, charset=utf8"
        
        switch self {
            
        default:
            return commonHeaders
        }
    }
    
}
