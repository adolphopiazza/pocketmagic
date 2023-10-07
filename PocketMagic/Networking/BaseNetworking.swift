//
//  BaseNetworking.swift
//  PocketMagic
//
//  Created by Adolpho Francisco Zimmermann Piazza on 07/10/23.
//

import Foundation

enum APIErrors: Error {
    case invalidURL
    case badDecoder(description: String)
}

final class BaseNetworking<Model: Decodable> {
    
    enum Endpoints: String {
        case characters
        case spells
    }
    
    private let baseAPI: String = "https://hp-api.onrender.com/api/"
    
    let endpoint: Endpoints
    
    init(endpoint: Endpoints) {
        self.endpoint = endpoint
    }
    
    func fetch() async throws -> [Model] {
        guard let url = URL(string: "\(baseAPI)\(endpoint.rawValue)") else {
            throw APIErrors.invalidURL
        }
        
        let model: [Model]
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            model = try decoder.decode([Model].self, from: data)
        } catch {
            print(error)
            throw APIErrors.badDecoder(description: error.localizedDescription)
        }
        
        return model
    }
    
}
