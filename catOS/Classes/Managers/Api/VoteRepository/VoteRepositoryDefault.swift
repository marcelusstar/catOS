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
        try? requestManager.doAsyncRequest(apiRouter: .voteImage(userSubId, imageId, like))
    }
}
