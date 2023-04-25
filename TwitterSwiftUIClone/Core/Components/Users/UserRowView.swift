//
//  UserRowView.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 25.4.23..
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("dime")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Dime9")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
