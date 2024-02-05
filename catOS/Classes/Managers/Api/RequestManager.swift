//
//  RequestManager.swift
//  catOS
//
//

import Foundation

class RequestManager {
    
    static let shared: RequestManager = {
        let instance = RequestManager()
        return instance
    }()
    
    func doRequest(apiRouter: ApiRouter) {
        let session = URLSession.shared
        let url = URL(string: apiRouter.path)!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = apiRouter.method.rawValue
        request.allHTTPHeaderFields = apiRouter.headers
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data,
                    error == nil,
                  let response = response as? HTTPURLResponse else {
                print("Request error: \(error!)")
                return
            }
            
            if response.statusCode >= 200 && response.statusCode <= 299 {
                print("Request successful \(data)")
                if let jsonString = String(data: data, encoding: .utf8) {
                            print(jsonString)
                         }
            }
            else {
                print("Request error, code: \(response.statusCode)")
            }
            
        }.resume()
    }
    
    func doAsyncAwaitRequest<T: Decodable>(apiRouter: ApiRouter) async throws -> T {
        let session = URLSession.shared
        let url = URL(string: apiRouter.path)!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = apiRouter.method.rawValue
        request.allHTTPHeaderFields = apiRouter.headers
        if apiRouter.method == .post {
            request.httpBody = apiRouter.body
        }
        
        let (data, response) = try await session.data(for: request)
        
        if let stringData = String(data: data, encoding: .utf8) {
                    // Use the stringData as needed
                    //print(stringData)
                } else {
                    print("Unable to convert data to string using UTF-8 encoding.")
                }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return result
    }

}
