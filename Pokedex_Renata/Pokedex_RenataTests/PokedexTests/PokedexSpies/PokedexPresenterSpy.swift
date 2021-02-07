//
//  PokedexPresenterSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex

class PokedexPresenterSpy {
    var presentPokemonListErrorCalled = false
    var presentPokemonListCalled = false
}

extension PokedexPresenterSpy: PokedexPresentationLogic {
    func presentPokemonListError() {
        presentPokemonListErrorCalled = true
    }
    
    func presentPokemonList(response: PokedexModels.FetchPokemonList.Response) {
        presentPokemonListCalled = true
    }
}
