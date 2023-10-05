//
//  CharactersView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 04/10/23.
//

import SwiftUI

struct CharactersView: View {
    
    var body: some View {
        Text("Characters list view!")
    }
    
}

#Preview("Light Mode") {
    CharactersView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    CharactersView()
        .preferredColorScheme(.dark)
}
