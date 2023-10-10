//
//  SpellsViewModel.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 09/10/23.
//

import Foundation

@Observable final class SpellsViewModel {
    
    var spells: [SpellsModel] = []
    var errorMessage: String = ""
    
    init() {
        Task {
            await fetch()
        }
    }
    
    func fetch() async {
        do {
            spells = try await SpellsService.shared.fetchSpells()
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
