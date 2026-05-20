//
//  FavoriteImageAPIEndpoint.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

struct FavoriteImageAPIEndpoint: APIRequestDefinition {
    let subId: String
    let imageId: String
    
    var path: String {
        let baseUrl = EnvironmentConfiguration.apiBaseUrl
        let endpoint = "\(baseUrl)/favourites"
        return endpoint
    }

    var method: HTTPMethod { HTTPMethod.post }
        
    var headers: [String: String]? {
        var commonHeaders: [String: String] = [:]
        commonHeaders["cache-control"] = "no-cache"
        commonHeaders["x-api-key"] = EnvironmentConfiguration.apiKey
        commonHeaders["Content-type"] = "application/json; charset=utf8"
        return commonHeaders
    }
    
    var body: Data? {
        let data: [String: Any] = [ApiParamsName.subId: subId,
                                   ApiParamsName.imageId: imageId]
        
        return try? JSONSerialization.data(
            withJSONObject: data,
            options: []
        )
    }
    
    var queryParameters: [String : String]? { nil }
}
