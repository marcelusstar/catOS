//
//  ApiManager.swift
//  catOS
//
//  Created by rosadiez on 5/2/24.
//

import Foundation


class ApiManager {
    
    static let shared: ApiManager = {
        let instance = ApiManager()
        return instance
    }()
    
    func getFeedImages(page: Int) async -> [FeedImage] {
        do {
            let feedImagesEntities: [FeedImageEntity] = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.feedImages(page))
            
            return feedImagesEntities.map {
                ApiTransformer.shared.transformFeedImageEntity(entity: $0)
            }
            
        } catch {
            return [FeedImage]()
        }
    }
 
    func getBreeds() async -> [Breed] {
        do {
            let breedsEntities: [BreedEntity] = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreeds)
            
            return breedsEntities.map {
                ApiTransformer.shared.transformBreedEntity(entity: $0)
            }
        }catch {
            return [Breed]()
        }
    }
    
    func getBreed(id: String) async -> Breed? {
        do {
            let breedEntity: BreedEntity = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreed(id))
            
                return ApiTransformer.shared.transformBreedEntity(entity: breedEntity)

        }catch {
            return nil
        }
    }
    
}
