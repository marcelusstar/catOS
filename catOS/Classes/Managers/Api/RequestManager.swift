//
//  RequestManager.swift
//  catOS
//
//

import Foundation

struct RequestManager {
    
    static let shared: RequestManager = RequestManager()
    
    var networkReachability: NetworkReachability = NetworkReachability()
    
    func doAsyncAwaitRequest<T: Decodable>(apiRouter: ApiRouter) async throws -> T {
        
        let session = URLSession.shared
        let url = URL(string: apiRouter.path)!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = apiRouter.method.rawValue
        request.allHTTPHeaderFields = apiRouter.headers
        if apiRouter.method == .post {
            request.httpBody = apiRouter.body
        }
        
        var (data, response) = (Data(), URLResponse())
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            if let nsError = error as NSError?, 
                nsError.domain == NSURLErrorDomain,
                nsError.code == NSURLErrorNotConnectedToInternet {
                    throw CatError.noInternet
            }
            
            throw CatError.internetConnection
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...299:
                print("Request was successful. \(apiRouter.path)")
            case 400...499:
                print("Client error: \(httpResponse.statusCode)")
                throw CatError.badRequest
            case 500...599:
                print("Server error: \(httpResponse.statusCode)")
                throw CatError.serverError
            default:
                print("Unexpected status code: \(httpResponse.statusCode)")
                throw CatError.genericError
            }
        } else {
            throw CatError.genericError
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        }
        catch {
            throw CatError.genericError
        }
    }

}
