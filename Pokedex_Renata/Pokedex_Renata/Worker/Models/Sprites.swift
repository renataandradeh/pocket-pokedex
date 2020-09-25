//
//  Sprites.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 14/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct Sprites: Model {
    static func == (lhs: Sprites, rhs: Sprites) -> Bool {
        return lhs.other == rhs.other
    }
    
    let backDefault: String
    let frontDefault: String
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
        case other
    }
}
