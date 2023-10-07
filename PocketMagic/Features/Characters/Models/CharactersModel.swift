//
//  CharactersModel.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 07/10/23.
//

import Foundation

struct CharactersModel: Decodable, Identifiable {
    
    let id: UUID
    let name: String
    let actor: String
    
}
