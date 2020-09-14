//
//  Game.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 14/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct Game: Codable {
    let gameIndex: Int
    let version: Reference
    
    private enum CodingKeys : String, CodingKey {
        case gameIndex = "game_index", version
    }
}
