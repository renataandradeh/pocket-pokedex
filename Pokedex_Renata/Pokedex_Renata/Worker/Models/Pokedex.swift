//
//  Pokedex.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol Model: Codable, Equatable {}

struct Pokedex: Model {
    let count: Int
    let next: String
    let previous: String
    let results: [PokemonReference]
}
