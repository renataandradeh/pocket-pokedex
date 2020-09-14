//
//  Ability.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 14/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct Ability: Codable {
    let ability: Reference
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
