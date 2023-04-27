//
//  AuthViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 26.4.23..
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    var didAuthenticateUser: (() -> Void)?
    private var tempUserSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func logIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sig in user with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Did log user in..")
            
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register user with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
//            self.userSession = user
            
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser?()
                }
        }
        
    }
    
    func signOut() {
        userSession = nil
        
        // signs user out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        self.userSession = self.tempUserSession
                    }
                }
        }
    }
    
}
