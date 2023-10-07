//
//  CharactersViewModel.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 07/10/23.
//

import SwiftUI

@Observable final class CharactersViewModel {
    
    let viewTitle: String = "Characters"
    var characters: [CharactersModel] = []
    var errorMessage: String = ""
    
    init() {
        Task {
            await fetch()
        }
    }
    
    func fetch() async {
        do {
            characters = try await CharactersService.shared.fetchCharacters()
        } catch APIErrors.invalidURL {
            print("API Error: invalid url")
            errorMessage = "Invalid URL. Please double check it."
        } catch APIErrors.badDecoder(let error) {
            print("API Error: \(error)")
            errorMessage = "\(error)"
        } catch {
            print("Other error. \(error)")
        }
    }
    
}
