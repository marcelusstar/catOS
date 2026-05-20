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
    
    func getBreeds(limit: Int = 100) async throws -> [Breed] {
        let endpoint = BreedsAPIEndpoint(limit: limit)
        let breedsEntities: [BreedDTO] = try await requestManager.doAsyncAwaitRequest(apiInfo: endpoint)
        return breedsEntities.map { apiTransformer.transformBreedEntity(entity: $0) }
    }
    
    func getBreed(id: String) async throws -> Breed {
        let endpoint = BreedAPIEndpoint(id: id)
        let breedEntity: BreedDTO = try await requestManager.doAsyncAwaitRequest(apiInfo: endpoint)
        return apiTransformer.transformBreedEntity(entity: breedEntity)
    }
}
