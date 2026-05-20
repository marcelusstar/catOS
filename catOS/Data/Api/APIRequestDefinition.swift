//
//  APIRequestDefinition.swift
//  catOS
//
//  Created by rosadiez on 20/5/26.
//

import Foundation

protocol APIRequestDefinition {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var queryParameters: [String: String]? { get }
}
