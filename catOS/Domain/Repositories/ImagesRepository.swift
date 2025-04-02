//
//  ImagesRepository.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol ImagesRepository {
    func getFeedImages(limit: Int) async throws -> [FeedImage]
}
