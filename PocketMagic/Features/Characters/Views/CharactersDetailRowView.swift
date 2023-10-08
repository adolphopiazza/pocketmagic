//
//  CharactersDetailRowView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 08/10/23.
//

import SwiftUI

struct CharactersDetailRowView: View {
    
    let leadingText: String
    let trailingText: String
    
    var body: some View {
        HStack {
            Text(leadingText)
            
            Spacer()
            
            Text(trailingText.isEmpty ? "No data" : trailingText)
                .foregroundStyle(.gray)
        }
    }
    
}

#Preview("Light Mode") {
    CharactersDetailRowView(leadingText: "Name", trailingText: "Harry Potter")
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    CharactersDetailRowView(leadingText: "Name", trailingText: "Harry Potter")
        .preferredColorScheme(.dark)
}
