//
//  Tweet.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 29.4.23..
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Codable {
    
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
    
}
