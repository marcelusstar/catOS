//
//  VoteRepository.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

struct VoteRepositoryDefault: VoteRepository {
    
    let requestManager: RequestManagerProtocol
    let apiTransformer: ApiTransformer
    let userSubId: String
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         apiTransformer: ApiTransformer = ApiTransformer()) {
        self.requestManager = requestManager
        self.apiTransformer = apiTransformer
        self.userSubId = CustomUserDefaults().getUserId()
    }
    
    func voteImage(imageId: String, like: Bool) {
        let endpoint = VoteImageAPIEndpoint(subId: userSubId, imageId: imageId, vote: like)
        try? requestManager.doAsyncRequest(apiInfo: endpoint)
    }
}
