//
//  ProfileViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 30.4.23..
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
    }
    
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            // display of tweets on the profile
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
}
