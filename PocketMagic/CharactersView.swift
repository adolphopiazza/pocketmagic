//
//  CharactersView.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 04/10/23.
//

import SwiftUI

struct CharactersModel: Decodable, Identifiable {
    let id: UUID
    let name: String
    let actor: String
}

class Networking {
    
    let baseAPI = "https://hp-api.onrender.com/api/characters"
    
    func fetchCharacters() async throws -> [CharactersModel] {
        guard let url = URL(string: baseAPI) else { throw NSError() }
        let model: [CharactersModel]
        
        do {
            // talvez separar em uma função para cada try
            let (data, _) = try await URLSession.shared.data(from: url)
            model = try JSONDecoder().decode([CharactersModel].self, from: data)
        } catch {
            throw error
        }
        
        return model
    }
    
}

struct CharactersView: View {
    
    @State private var characters: [CharactersModel] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(characters) { character in
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.headline)
                        
                        Text(character.actor.isEmpty ? "Not found" : character.actor)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear(perform: {
            let networking = Networking()
            Task {
                do {
                    let model = try await networking.fetchCharacters()
                    characters = model
                    print(characters)
                } catch {
                    print(error)
                }
            }
        })
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
