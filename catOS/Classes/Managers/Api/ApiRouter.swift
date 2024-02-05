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
    case voteImage(String, String, Int)      // Votar una imagen (like o dislike)
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
        
        var url = switch self {
            
        case .randomImage:
            "images/search"
        case .getBreeds:
            "breeds?limit=100"
        case .getBreed(let id):
            "breeds/\(id)"
        case .voteImage:
            "votes"
        }
        
        return"\(baseUrl)/\(url)"
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

        
        switch self {
            
        case .voteImage:
            commonHeaders["x-api-key"] = "XXXXXXXX"
            commonHeaders["Content-type"] = "application/json; charset=utf8"
            
        default:
            commonHeaders["Content-type"] = "application/x-www-form-urlencoded, charset=utf8"
            
        }
        
        return commonHeaders
    }
    
    var body: Data? {
        
        let data: [String: Any] = switch self {
            
            case .voteImage(let userId, let imageId, let points):
                    ["sub_id": userId,
                    "image_id": imageId,
                    "value": points]
                
            default:
                ["": ""]
        }
        

        
        return try? JSONSerialization.data(
            withJSONObject: data,
            options: []
        )
    }
    
}
