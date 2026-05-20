//
//  RequestManager.swift
//  catOS
//
//

import Foundation

struct RequestManager: RequestManagerProtocol {
    
    private func getURLSession() -> URLSession {
        return URLSession.shared
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
    
    private func getURLRequest(apiInfo: APIRequestDefinition) throws -> URLRequest {
        var urlComponents = URLComponents(string: apiInfo.path)
        
        if let queryParameters = apiInfo.queryParameters, !queryParameters.isEmpty {
            urlComponents?.queryItems = queryParameters.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        
        guard let url = urlComponents?.url else {
            throw CatError.genericError
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = apiInfo.method.rawValue
        request.allHTTPHeaderFields = apiInfo.headers
        
        request.httpBody = apiInfo.body
        
        return request
    }
    
    func doAsyncAwaitRequest<T: Decodable>(apiInfo: APIRequestDefinition) async throws -> T {
        
        let session = URLSession.shared
        let request: URLRequest = try getURLRequest(apiInfo: apiInfo)
        
        print("RequestManager: \(request.url?.absoluteString ?? "")")
        
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
    
    func doAsyncRequest(apiInfo: APIRequestDefinition) throws {
        Task(priority: .background) {
            let session = URLSession.shared
            let request: URLRequest = try getURLRequest(apiInfo: apiInfo)
            do {
                _ = try await session.data(for: request)
            } catch {
                if let nsError = error as NSError?,
                    nsError.domain == NSURLErrorDomain,
                    nsError.code == NSURLErrorNotConnectedToInternet {
                        throw CatError.noInternet
                }
                
                throw CatError.genericError
            }
        }
    }
}
