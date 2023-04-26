//
//  TwitterSwiftUICloneApp.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 24.4.23..
//

import SwiftUI
import Firebase

@main
struct SwiftUI_FirebaseApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
