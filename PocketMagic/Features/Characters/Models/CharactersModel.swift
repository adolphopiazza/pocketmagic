//
//  CharactersModel.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 07/10/23.
//

import Foundation

struct CharactersModel: Decodable, Identifiable, Hashable {
    
    let id: UUID
    let name: String
    let alternateNames: [String]?
    let species: String
    let gender: String
    let house: String
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: WandModel?
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let alternateActors: [String]?
    let alive: Bool
    let image: String
    
}
