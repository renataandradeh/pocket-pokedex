//
//  PokedexModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

enum PokedexModels {
    enum FetchPokemonList {
        struct Request {
        }
        
        struct Response: Model {
            let pokemonList: [Pokemon]
        }
        
        struct ViewModel {
            let pokemonNames: [String]
        }
    }
}
