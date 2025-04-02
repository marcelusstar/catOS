//
//  BreedsRepositoryDefault.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

struct BreedsRepositoryDefault: BreedsRepository {
    let requestManager: RequestManagerProtocol
    let apiTransformer: ApiTransformer
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         apiTransformer: ApiTransformer = ApiTransformer()) {
        self.requestManager = requestManager
        self.apiTransformer = apiTransformer
    }
    
    func getBreeds() async throws -> [Breed] {
        let breedsEntities: [BreedDTO] = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreeds)
        return breedsEntities.map { apiTransformer.transformBreedEntity(entity: $0) }
    }
    
    func getBreed(id: String) async throws -> Breed {
        let breedEntity: BreedDTO = try await requestManager.doAsyncAwaitRequest(apiRouter: ApiRouter.getBreed(id))
        return apiTransformer.transformBreedEntity(entity: breedEntity)
    }
}
