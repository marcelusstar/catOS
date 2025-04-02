//
//  ImagesRepositoryDefault.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

struct ImagesRepositoryMock: ImagesRepository {
    
    let feedImages: [FeedImage] = [
        FeedImage(id: "0", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/MTc1ODk0OQ.jpg"),
        FeedImage(id: "1", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/der.jpg"),
        FeedImage(id: "2", breeds: [], categories: [], height: 10, width: 20, url: "https://cdn2.thecatapi.com/images/797.png")
    ]
    
    func getFeedImages(limit: Int) async throws -> [FeedImage] {
        return feedImages
    }
}
