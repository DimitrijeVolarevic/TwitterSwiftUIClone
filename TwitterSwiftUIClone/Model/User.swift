//
//  User.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 28.4.23..
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id}
}
