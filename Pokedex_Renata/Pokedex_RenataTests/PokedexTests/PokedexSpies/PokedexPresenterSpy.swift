//
//  PokedexPresenterSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokedexPresenterSpy {
    var presentPokemonListCalled = false
}

extension PokedexPresenterSpy: PokedexPresentationLogic {
    func presentPokemonList(response: PokedexModels.FetchPokemonList.Response) {
        presentPokemonListCalled = true
    }
}
