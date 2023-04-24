//
//  TweetRowView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 24.4.23..
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            tweetCell
            
            actionButtons
                .padding()
            Divider()
        }
        .padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}

extension TweetRowView {
    private var actionButtons: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "bubble.left")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "bookmark")
                    .font(.subheadline)
            }

        }
        .foregroundColor(.gray)
    }
    
    
    private var tweetCell: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Dimitrije Volarevic")
                        .font(.subheadline.bold())
                    Text("@dime")
                        .foregroundColor(.gray)
                        .font(.caption)
                    Text("2w")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                Text("Liga Sampiona nikad neizvesnija")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
