//
//  Sprites.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 14/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

class Sprites: Model {
    static func == (lhs: Sprites, rhs: Sprites) -> Bool {
        return lhs.animated == rhs.animated
    }
    
    let backDefault: String
    let frontDefault: String
    let animated: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
        case animated
    }
}
