//
//  CharactersService.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 07/10/23.
//

import Foundation

final class CharactersService {
    
    static let shared: CharactersService = CharactersService()
    
    private let baseNetworking = BaseNetworking<CharactersModel>(endpoint: .characters)
    
    init() {}
    
    func fetchCharacters() async throws -> [CharactersModel] {
        do {
            return try await baseNetworking.fetch()
        } catch {
            throw error
        }
    }
    
}
