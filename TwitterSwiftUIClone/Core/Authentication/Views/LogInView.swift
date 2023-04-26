//
//  LogInView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 26.4.23..
//

import SwiftUI

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthenticationHeader(title1: "Hello.", title2: "Welcome Back.")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password, isSecureField: true)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink  {
                    Text("Reset password view")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }

            }
            
            Button {
                viewModel.logIn(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: .gray.opacity(0.6), radius: 10, x: 0, y: 0)
            }

            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.subheadline)
                    
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom, 40)
            .foregroundColor(Color(.systemBlue))

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

