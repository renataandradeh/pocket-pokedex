//
//  Endpoint.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct URLBuilder {
    private static let baseURL = "https://pokeapi.co/api/v2/"
    
    enum PokedexEndpoint {
        case fetchPokemonReferenceList
        
        var path: String {
            switch self {
            case .fetchPokemonReferenceList:
                return "pokemon/?limit=10&offset=10"
            }
        }
    }
    
    static func make(withEndpoint endpoint: PokedexEndpoint) -> URL {
        return URL(string: baseURL + endpoint.path)!
    }
}
