//
//  UserStatsView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 25.4.23..
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                Text("350")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            
            HStack(spacing: 4) {
                Text("5.1M")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
