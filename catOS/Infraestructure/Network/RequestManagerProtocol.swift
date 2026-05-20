//
//  RequestManagerProtocol.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

protocol RequestManagerProtocol {
    
    func doAsyncAwaitRequest<T: Decodable>(apiInfo: APIRequestDefinition) async throws -> T
    
    func doAsyncRequest(apiInfo: APIRequestDefinition) throws
}
