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
    case feedImages(Int)     // Imagenes random para el feed
    case myFavs(String, Int)         // Obtener imagenes favoritas del usuario
    /*

    case generalVotes   // Obtener todas las imagenes votadas. Se podría filtrar por mas votadas por fecha y pais
    case uploadImage    // Subir una imagen
    case deleteImage    // Borrar una imagen (propia del usuario)
    case myImages       // Obtener las imagenes que has subido
    case favImage       // Favoritear una imagen
    case unfavImage     // Desfavoritear una imagen
    
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
        case .feedImages(let page):
            "images/search?format=json&order=RANDOM&page=\(page)&limit=10"
        case .myFavs(let subId, let page):
            "favourites?limit=20&page=\(page)&order=Desc&sub_id=\(subId)"
        }
        
        return"\(baseUrl)/\(url)"
    }

    var method: HTTPMethod {
        switch self {
            
        case .randomImage, .getBreeds, .getBreed(_), .feedImages(_), .myFavs(_, _):
            return HTTPMethod.get
        case .voteImage:
            return HTTPMethod.post
        }
    }
        
    var headers: [String: String] {
        
        var commonHeaders: [String: String] = [:]
        
        commonHeaders["cache-control"] = "no-cache"

        let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist") ?? ""
        let plistData = NSDictionary(contentsOfFile: plistPath)
        // Add the api key in Config.xcconfig or replace the default value
        let apiKey: String? = (plistData?["API_KEY"] as? String) ?? "YOUR_OWN_API_KEY_IF_NOT_FOUND"
        
        switch self {
            
        case .voteImage, .feedImages(_), .myFavs(_, _):
            commonHeaders["x-api-key"] = apiKey
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
