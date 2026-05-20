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

    var method: HTTPMethod { HTTPMethod.get }
        
    var headers: [String: String]? {
        var commonHeaders: [String: String] = [:]
        commonHeaders["cache-control"] = "no-cache"
        commonHeaders["x-api-key"] = EnvironmentConfiguration.apiKey
        commonHeaders["Content-type"] = "application/json; charset=utf8"
        return commonHeaders
    }
    
    var body: Data? { nil }
    
    var queryParameters: [String : String]? {
        [
            ApiParamsName.page: "\(page)",
            ApiParamsName.order: "Desc",
            ApiParamsName.limit: "\(limit)",
            ApiParamsName.subId : "\(subId)"
        ]
    }
}
