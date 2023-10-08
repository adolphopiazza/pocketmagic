//
//  CharactersView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 04/10/23.
//

import SwiftUI

struct CharactersView: View {
    
    @State var viewModel: CharactersViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List(viewModel.characters) { character in
                NavigationLink(value: character) {
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.headline)
                        
                        Text(character.actor.isEmpty ? "Not found" : character.actor)
                            .font(.subheadline)
                            
                    }
                }
            }
            .navigationTitle(viewModel.viewTitle)
            .navigationDestination(for: CharactersModel.self, destination: { character in
                CharactersDetailView(characterModel: character)
            })
            .overlay {
                if viewModel.characters.isEmpty && viewModel.errorMessage.isEmpty {
                    ProgressView("Loading...")
                }
            }
            .overlay {
                if !viewModel.errorMessage.isEmpty {
                    ContentUnavailableView("Something went wrong 😕",
                                           systemImage: .SystemImages.xCircle,
                                           description: Text(viewModel.errorMessage))
                }
            }
        }
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
