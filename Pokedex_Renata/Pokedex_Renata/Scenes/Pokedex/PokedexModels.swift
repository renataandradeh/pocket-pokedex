//
//  PokedexModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokemonItem {
    let name: String
    let url: URL
    let tags: [TagLabel]
    let itemColor: UIColor
}

enum PokedexModels {
    enum FetchPokemonList {
        struct Request {
        }
        
        struct Response: Model {
            let pokemons: [Pokemon]
        }
        
        struct ViewModel {
            let pokemons: [PokemonItem]
        }
    }
}
