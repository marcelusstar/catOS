//
//  VoteRepository.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

protocol VoteRepository {
    func voteImage(imageId: String, like: Bool)
}
