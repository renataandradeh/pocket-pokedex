//
//  PokemonAbilitiesModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct SingleAbility {
    let name: String
    let slot: Int
}

enum PokemonAbilitiesModels {
    enum DisplayAbilities {
        struct Response {
            let pokemon: Pokemon?
        }
        struct ViewModel {
            let abilities: [SingleAbility]
        }
    }
}
