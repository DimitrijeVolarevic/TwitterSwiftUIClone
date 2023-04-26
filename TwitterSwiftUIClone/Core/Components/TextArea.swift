//
//  TextArea.swift
//  TwitterSwiftUIClone
//
//  Created by Dimitrije Volarevic on 25.4.23..
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholder)
                    .padding(.horizontal,8)
                    .padding(.vertical, 12)
                    .foregroundColor(Color(.placeholderText))
            }
            
                
                
        }
        .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea("What's happening?", text: .constant("What's happening.."))
            .foregroundColor(Color(.placeholderText))
            .frame(height: 100)
            .previewLayout(.sizeThatFits)
    }
}
