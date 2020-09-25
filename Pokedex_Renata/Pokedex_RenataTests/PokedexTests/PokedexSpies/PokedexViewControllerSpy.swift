//
//  PokedexViewControllerSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex

class PokedexViewControllerSpy {
    var displayPokemonListCalled = false
}

extension PokedexViewControllerSpy: PokedexDisplayLogic {
    func displayPokemonList(viewModel: PokedexModels.FetchPokemonList.ViewModel) {
        displayPokemonListCalled = true
    }
}
