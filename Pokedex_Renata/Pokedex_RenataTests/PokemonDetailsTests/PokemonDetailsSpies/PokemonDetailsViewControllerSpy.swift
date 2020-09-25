//
//  PokemonDetailsViewControllerSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokemonDetailsViewControlllerSpy {
    var displayPokemonDetailsCalled = false
    var displayAddedToFavoritesCalled = false
    var displayAddingToFavoritesErrorCalled = false
}

extension PokemonDetailsViewControlllerSpy: PokemonDetailsDisplayLogic {
    func displayAddingToFavoritesError(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel) {
        displayAddingToFavoritesErrorCalled = true
    }
    
    func displayPokemonDetails(viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel) {
        displayPokemonDetailsCalled = true
    }
    
    func displayAddedToFavorites(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel) {
        displayAddedToFavoritesCalled = true
    }
}
