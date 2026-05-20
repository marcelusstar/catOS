//
//  RequestManagerProtocol.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

protocol RequestManagerProtocol {
   
    // TODO: Remove this method once refactoring from ApiRouter to APIRequestDefinition was done
    func doAsyncAwaitRequest<T: Decodable>(apiRouter: ApiRouter) async throws -> T
    
    func doAsyncAwaitRequest<T: Decodable>(apiInfo: APIRequestDefinition) async throws -> T
    
    func doAsyncRequest(apiRouter: ApiRouter) throws
}
