import UIKit

class CatData: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    
    init() {
        self.id = ""
        self.url = ""
        self.width = 0
        self.height = 0
    }
}


var apiRoute: ApiRouter = .randomImage

ApiManager.shared.doRequest(apiRouter: apiRoute)

Task {
    do {
        let result: RandomImage = try await ApiManager.shared.doAsyncAwaitRequest(apiRouter: apiRoute)
        print(result)
    }
    catch {
        print("Exception")
    }
    
    
}
