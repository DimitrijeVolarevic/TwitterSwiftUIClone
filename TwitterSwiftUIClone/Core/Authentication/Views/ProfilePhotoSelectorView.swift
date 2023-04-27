//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 27.4.23..
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthenticationHeader(title1: "Setup account",
                                 title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                VStack {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .font(Font.system(.title).weight(.ultraLight))
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding(40)
                    } else {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFill()
                            .font(Font.system(.title).weight(.ultraLight))
                            .frame(width: 150, height: 150)
                            .padding(.top, 45)
                        
                        Text("Photo")
                            .font(.title2)
                            .padding(.top, 5)
                            .bold()
                    }
                        
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImgae) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .cornerRadius(30)
                        .padding(35)
                        .shadow(color: .gray.opacity(0.6), radius: 10, x: 0, y: 0)
                }
            }

            
            Spacer()
            
        }
        .ignoresSafeArea()
        
        
    }
    
    // allows us to construct a swiftui image from uikit image
    func loadImgae() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
