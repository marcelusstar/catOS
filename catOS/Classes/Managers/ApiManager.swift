//
//  ApiManager.swift
//  catOS
//
//

import Foundation

struct RandomImage: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    
    init() {
        self.id = ""
        self.url = ""
        self.width = 0
        self.height = 0
    }
}


class ApiManager {
    
    static let shared: ApiManager = {
        let instance = ApiManager()
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
        
        let (data, response) = try await session.data(for: request)
        
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return result
    }
}
