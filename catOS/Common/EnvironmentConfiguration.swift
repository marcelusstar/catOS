//
//  EnvironmentConfiguration.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

struct EnvironmentConfiguration {
    private static func value(for key: String) -> String {
        Bundle.main.object(forInfoDictionaryKey: key) as? String ?? ""
    }
    
    static let apiBaseUrl: String = value(for: "API_BASE_URL")
    static let apiBaseCdnUrl: String = value(for: "API_BASE_CDN_URL")
    static let apiBaseCdnUrlImages: String = "\(value(for: "API_BASE_CDN_URL"))/images"
    static let apiKey: String = value(for: "API_KEY")
    
    static var baseUrl: String { "https://api.thecatapi.com/v1" }
    static var baseCdnUrl: String { "https://cdn2.thecatapi.com" }
    static var baseCdnUrlImages: String { "\(baseCdnUrl)/images" }
}
