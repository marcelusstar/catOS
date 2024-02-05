//
//  ApiRouter.swift
//  catOS
//
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

enum ApiRouter {
        
    case randomImage    // Imagen random
    case getBreeds
    case getBreed(String)
    case voteImage      // Votar una imagen (like o dislike)
    /*
    case feedImages     // Imagenes random para el feed
    case generalVotes   // Obtener todas las imagenes votadas. Se podría filtrar por mas votadas por fecha y pais
    case uploadImage    // Subir una imagen
    case deleteImage    // Borrar una imagen (propia del usuario)
    case myImages       // Obtener las imagenes que has subido
    case favImage       // Favoritear una imagen
    case unfavImage     // Desfavoritear una imagen
    case myFavs         // Obtener imagenes favoritas del usuario
    case breeds         // Obtener los datos de las razas
    case breedId        // Obtener los datos de una raza en concreto
    case searchBreeds   // Buscar una raza por su nombre
                        // Actividad del usuario (imagenes con like y dislike)
     */
    
    
    var baseUrl: String { "https://api.thecatapi.com/v1" }
    
    var path: String {
        switch self {
            
        case .randomImage:
            "\(baseUrl)/images/search"
        case .getBreeds:
            "\(baseUrl)/breeds?limit=100"
        case .getBreed(let id):
            "\(baseUrl)/breeds/\(id)"
        case .voteImage:
            "\(baseUrl)/votes"
        }
    }

    var method: HTTPMethod {
        switch self {
            
        case .randomImage, .getBreeds, .getBreed(_):
            return HTTPMethod.get
        case .voteImage:
            return HTTPMethod.post
        }
    }
        
    var headers: [String: String] {
        
        var commonHeaders: [String: String] = [:]
        
        commonHeaders["cache-control"] = "no-cache"
        commonHeaders["Accept"] = "application/json"
        commonHeaders["Content-type"] = "application/x-www-form-urlencoded, charset=utf8"
        
        switch self {
            
        case .voteImage:
            commonHeaders["x-api-key"] = "XXXXXXXX"
            
        default:
            return commonHeaders
        }
        
        return commonHeaders
    }
    
    
}
