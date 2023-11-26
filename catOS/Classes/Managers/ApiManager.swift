//
//  ApiManager.swift
//  catOS
//
//

import Foundation



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
            }
            else {
                print("Request error, code: \(response.statusCode)")
            }
            
        }.resume()
    }
    
}
