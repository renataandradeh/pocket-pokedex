//
//  PokemonInfoPresenterSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoPresenterSpy {
    var presentPokemonGamesCalled = false
    var presentPokemonStatsCalled = false
    var presentPokemonAbilitiesCalled = false
}

extension PokemonInfoPresenterSpy: PokemonInfoPresentationLogic {
    func presentPokemonGames(
        response: PokemonInfoModels.DisplayPokemonInfo.Response
    ) {
        presentPokemonGamesCalled = true
    }
    
    func presentPokemonStats(
        response: PokemonInfoModels.DisplayPokemonInfo.Response
    ) {
        presentPokemonStatsCalled = true
    }
    
    func presentPokemonAbilities(
        response: PokemonInfoModels.DisplayPokemonInfo.Response
    ) {
        presentPokemonAbilitiesCalled = true
    }
}
