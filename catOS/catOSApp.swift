//
//  catOSApp.swift
//  catOS
//
//

import SwiftUI

@main
struct catOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                   // Call the doAsyncAwaitRequest function asynchronously
                   Task {
                           /*
                           let voteResult: VoteResultEntity = try await RequestManager.shared.doAsyncAwaitRequest(apiRouter: ApiRouter.voteImage("an7", "soyelctangana", 1))
                            */
                           /*
                           let breeds: [Breed] = await ApiManager.shared.getBreeds()
                           for breed in breeds {
                               print(breed.name)
                           }*/
                                             
                       do {
                           let feedImages: [FeedImage] = try await ApiManager.shared.getFeedImages(page: 1)
                           for feedImage in feedImages {
                               print(feedImage.id)
                           }
                       } 
                       catch {
                           ErrorManager.shared.process(error as! CatError)
                       }
                   }
               }
        }
    }
}
