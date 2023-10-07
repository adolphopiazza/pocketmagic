//
//  TabBarView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 04/10/23.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: .SystemImages.person3Fill)
                }
        }
    }
    
}

#Preview("Light Mode", body: {
    TabBarView()
        .preferredColorScheme(.light)
})

#Preview("Dark Mode", body: {
    TabBarView()
        .preferredColorScheme(.dark)
})
