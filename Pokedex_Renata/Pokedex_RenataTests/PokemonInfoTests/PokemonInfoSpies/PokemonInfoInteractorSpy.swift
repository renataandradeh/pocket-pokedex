//
//  PokemonInfoInteractorSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoInteractorSpy {
    var getCurrentPokemonInfoCalled = false
}

extension PokemonInfoInteractorSpy: PokemonInfoBusinessLogic {
    func getCurrentPokemonInfo(type: InfoType) {
        getCurrentPokemonInfoCalled = true
    }
}
