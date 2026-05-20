//
//  MyFavoritesAPIEndpoint.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

struct MyFavoritesAPIEndpoint: APIRequestDefinition {
    let subId: String
    let page: Int
    let limit: Int = 20
    
    var path: String {
        let baseUrl = EnvironmentConfiguration.apiBaseUrl
        let endpoint = "\(baseUrl)/favourites"
        return endpoint
    }

    var method: HTTPMethod { HTTPMethod.post }
        
    var headers: [String: String]? {
        var commonHeaders: [String: String] = [:]
        commonHeaders["cache-control"] = "no-cache"
        return commonHeaders
    }
    
    var body: Data? { nil }
    
    var queryParameters: [String : String]? {
        [
            ParamsName.page: "\(page)",
            ParamsName.order: "Desc",
            ParamsName.limit: "\(limit)",
            ParamsName.subId : "\(subId)"
        ]
    }
}
