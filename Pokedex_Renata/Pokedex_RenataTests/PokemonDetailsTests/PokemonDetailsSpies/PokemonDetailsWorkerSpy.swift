//
//  PokemonDetailsWorkerSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokemonDetailsWorkerSpy {
    var isFavoriteCalled = false
    var favoritePokemonCalled = false
    var addToFavoritesCalled = false
    
    var isSuccess: Bool
    
    init(isSuccess: Bool = true) {
        self.isSuccess = isSuccess
    }
}

extension PokemonDetailsWorkerSpy: PokemonDetailsWorkLogic {
    func isFavorite(pokemon: Pokemon?) -> Bool {
        isFavoriteCalled = true
        return isSuccess
    }
    
    func favoritePokemon(completion: @escaping (PokemonDetailsWorkerResult) -> Void) {
        favoritePokemonCalled = true
    }
    
    func addToFavorites(pokemon: Pokemon?) -> Bool {
        addToFavoritesCalled = true
        return true
    }
}


