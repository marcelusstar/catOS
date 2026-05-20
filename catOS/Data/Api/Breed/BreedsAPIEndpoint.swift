//
//  BreedsAPIEndpoint.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

struct BreedsAPIEndpoint: APIRequestDefinition {
    let limit: Int
    
    var path: String {
        let baseUrl = EnvironmentConfiguration.apiBaseUrl
        let endpoint = "\(baseUrl)/breeds"
        return endpoint
    }

    var method: HTTPMethod { HTTPMethod.get }
        
    var headers: [String: String]? {
        var commonHeaders: [String: String] = [:]
        commonHeaders["cache-control"] = "no-cache"
        return commonHeaders
    }
    
    var body: Data? { nil }
    
    var queryParameters: [String : String]? {
        [
            ParamsName.limit: "\(limit)"
        ]
    }
}
