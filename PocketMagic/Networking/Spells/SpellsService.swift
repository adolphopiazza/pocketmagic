//
//  SpellsService.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 09/10/23.
//

import Foundation

final class SpellsService {
    
    static let shared: SpellsService = SpellsService()
    
    private let baseNetworking = BaseNetworking<SpellsModel>(endpoint: .spells)
    
    init() {}
    
    func fetchSpells() async throws -> [SpellsModel] {
        do {
            return try await baseNetworking.fetch()
        } catch {
            throw error
        }
    }
    
}
