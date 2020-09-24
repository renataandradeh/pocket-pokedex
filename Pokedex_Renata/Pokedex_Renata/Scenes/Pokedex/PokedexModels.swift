//
//  PokedexModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokemonCell {
    let name: String
    let imageURL: String
    let cellColor: UIColor
}

enum PokedexModels {
    enum FetchPokemonList {
        struct Response: Model {
            let pokemons: [Pokemon]
        }
        
        struct ViewModel {
            let pokemonCells: [PokemonCell]
        }
    }
}
