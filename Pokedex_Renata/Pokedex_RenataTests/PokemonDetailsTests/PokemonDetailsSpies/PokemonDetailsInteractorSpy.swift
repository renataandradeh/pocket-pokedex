//
//  PokemonDetailsInteractorSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex

class PokemonDetailsInteractorSpy {
    var fetchCurrentPokemonDetailsCalled = false
    var favoritePokemonCalled = false
}

extension PokemonDetailsInteractorSpy: PokemonDetailsBusinessLogic {
    func fetchCurrentPokemonDetails() {
        fetchCurrentPokemonDetailsCalled = true
    }
    
    func favoritePokemon() {
        favoritePokemonCalled = true
    }
}
