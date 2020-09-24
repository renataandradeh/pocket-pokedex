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
    var getPokemonCalled = false
    var setCurrentCalled = false
}

extension PokedexInteractorSpy: PokedexBusinessLogic {
    func fetchPokemonList() {
        fetchPokemonListCalled = true
    }
    
    func getPokemon(at index: Int) -> Pokemon? {
        getPokemonCalled = true
        return nil
    }
    
    func setCurrent(pokemon: Pokemon) {
        setCurrentCalled = true
    }
}

