//
//  PokemonInfoModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct PokemonInfo {
    let title: String
    let value: Int?
}

enum PokemonInfoModels {
    enum DisplayPokemonInfo {
        struct Response {
            let pokemon: Pokemon?
        }
        struct ViewModel {
            let pageTitle: String
            let infoList: [PokemonInfo]
        }
    }
}
