//
//  GameIndex.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 14/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct GameIndex: Model {
    let gameIndex: Int
    let version: Reference

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}
