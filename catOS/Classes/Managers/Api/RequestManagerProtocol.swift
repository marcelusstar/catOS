//
//  RequestManagerProtocol.swift
//  catOS
//
//  Created by rosadiez on 12/8/24.
//

import Foundation

protocol RequestManagerProtocol {
   
    func doAsyncAwaitRequest<T: Decodable>(apiRouter: ApiRouter) async throws -> T
    
    func doAsyncRequest(apiRouter: ApiRouter) throws
}
