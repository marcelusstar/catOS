//
//  RequestManager.swift
//  catOS
//
//

import Foundation

struct RequestManager {
    
    static let shared: RequestManager = RequestManager()
    
    var networkReachability: NetworkReachability = NetworkReachability()
    
    private func getURLSession() -> URLSession {
        return URLSession.shared
    }
    
    private func getURLRequest(apiRouter: ApiRouter) throws -> URLRequest {
        guard let url = URL(string: apiRouter.path) else {
            //throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
            throw CatError.genericError
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = apiRouter.method.rawValue
        request.allHTTPHeaderFields = apiRouter.headers
        if apiRouter.method == .post {
            request.httpBody = apiRouter.body
        }
        
        return request
    }
    
    private func checkErrorFromCodeResponse(statusCode: Int) throws{
        switch statusCode {
        case 200...299:
            break
        case 400...499:
            print("Client error: \(statusCode)")
            throw CatError.badRequest
        case 500...599:
            print("Server error: \(statusCode)")
            throw CatError.serverError
        default:
            print("Unexpected status code: \(statusCode)")
            throw CatError.genericError
        }
    }
    
    func doAsyncAwaitRequest<T: Decodable>(apiRouter: ApiRouter) async throws -> T {
        
        let session = URLSession.shared
        let request: URLRequest = try getURLRequest(apiRouter: apiRouter)
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
            try checkErrorFromCodeResponse(statusCode: httpResponse.statusCode)
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

    func doRequest(apiRouter: ApiRouter) {
        do {
            let session = getURLSession()
            let request: URLRequest = try getURLRequest(apiRouter: apiRouter)
        
            let task = session.dataTask(with: request) { _, response, error in
                if let error = error {
                    print("Network request error: \(error)")
                }
            }

            DispatchQueue.main.async {
                task.resume()
            }
            
            
        } catch {
            return
        }
        
    }
}
