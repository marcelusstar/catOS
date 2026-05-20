//
//  BreedAPIEndpoint.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

struct BreedAPIEndpoint: APIRequestDefinition {
    let id: String
    
    var path: String {
        let baseUrl = EnvironmentConfiguration.apiBaseUrl
        let endpoint = "\(baseUrl)/breeds/\(id)"
        return endpoint
    }

    var method: HTTPMethod { HTTPMethod.get }
        
    var headers: [String: String]? {
        var commonHeaders: [String: String] = [:]
        commonHeaders["cache-control"] = "no-cache"
        return commonHeaders
    }
    
    var body: Data? { nil }
    
    var queryParameters: [String : String]? { nil }
}
