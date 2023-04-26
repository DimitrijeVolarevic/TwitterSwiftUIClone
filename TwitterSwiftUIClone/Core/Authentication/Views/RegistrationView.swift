//
//  RegistrationView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 26.4.23..
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthenticationHeader(title1: "Get Started.", title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)

                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullName, username: username)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .cornerRadius(30)
                    .padding(35)
                    .shadow(color: .gray.opacity(0.6), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
            
            NavigationLink {
                LogInView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.subheadline)
                    
                    Text("Sign In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom, 40)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
