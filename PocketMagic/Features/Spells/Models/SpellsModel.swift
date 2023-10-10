//
//  SpellsModel.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 09/10/23.
//

import Foundation

struct SpellsModel: Decodable, Identifiable {
    
    let id: UUID
    let name: String
    let description: String
    
}
