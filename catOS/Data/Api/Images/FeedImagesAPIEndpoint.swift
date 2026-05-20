//
//  FeedImagesAPIEndpoint.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

struct FeedImagesAPIEndpoint: APIRequestDefinition {    
    let limit: Int
    let breedId: String
    
    var path: String {
        let baseUrl = EnvironmentConfiguration.apiBaseUrl
        let endpoint = "\(baseUrl)/images/search"
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
            ApiParamsName.format: "json",
            ApiParamsName.order: "RANDOM",
            ApiParamsName.limit: "\(limit)",
            ApiParamsName.breedId : "\(breedId)"
        ]
    }
}
