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
