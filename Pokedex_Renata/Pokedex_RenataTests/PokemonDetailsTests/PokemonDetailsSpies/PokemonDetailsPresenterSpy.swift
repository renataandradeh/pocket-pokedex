//
//  PokemonDetailsPresenterSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokemonDetailsPresenterSpy {
    var presentPokemonDetailsCalled = false
    var presentAddedToFavoritesCalled = false
    var presentAddingToFavoritesErrorCalled = false
}

extension PokemonDetailsPresenterSpy: PokemonDetailsPresentationLogic {
    func presentAddingToFavoritesError() {
        presentAddingToFavoritesErrorCalled = true
    }
    
    func presentPokemonDetails(response: PokemonDetailsModels.DisplayPokemonDetails.Response) {
        presentPokemonDetailsCalled = true
    }
    
    func presentAddedToFavorites(response: PokemonDetailsModels.DisplayAddedToFavorites.Response) {
        presentAddedToFavoritesCalled = true
    }
}
