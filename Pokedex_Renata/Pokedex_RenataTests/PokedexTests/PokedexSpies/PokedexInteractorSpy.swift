//
//  PokedexInteractorSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokedexInteractorSpy {
    var fetchPokemonListCalled = false
    var setCurrentCalled = false
    var setCurrentPokemonCalled = false
}

extension PokedexInteractorSpy: PokedexBusinessLogic {
    func setCurrentPokemon(at index: Int) {
        setCurrentPokemonCalled = true
    }
    
    func fetchPokemonList() {
        fetchPokemonListCalled = true
    }
    
    func setCurrent(pokemon: Pokemon) {
        setCurrentCalled = true
    }
}

