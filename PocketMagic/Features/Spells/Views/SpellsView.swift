//
//  SpellsView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 09/10/23.
//

import SwiftUI

struct SpellsView: View {
    
    @State var viewModel: SpellsViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List(viewModel.spells) { spell in
                VStack(alignment: .leading) {
                    Text(spell.name)
                        .font(.headline)
                    
                    Text(spell.description)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Spells")
            .overlay {
                if viewModel.spells.isEmpty && viewModel.errorMessage.isEmpty {
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
    SpellsView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    SpellsView()
        .preferredColorScheme(.dark)
}
