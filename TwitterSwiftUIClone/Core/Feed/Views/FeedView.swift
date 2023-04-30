//
//  FeedView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 24.4.23..
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView: Bool = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "square.and.pencil.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 50, height: 50)
                    .padding()
                    .fullScreenCover(isPresented: $showNewTweetView) {
                        NewTweetView()
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(6)

            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
