//
//  PokemonStatusModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct BaseStat {
    let name: String
    let baseStat: Int
}

enum PokemonStatsModels {
    enum DisplayStats {
        struct Response {
            let pokemon: Pokemon?
        }
        struct ViewModel {
            let baseStats: [BaseStat]
        }
    }
}
