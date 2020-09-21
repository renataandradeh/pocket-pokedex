//
//  PokemonAbilitiesInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonAbilitiesBusinessLogic {
    func getCurrentPokemonAbilities()
}

protocol PokemonAbilitiesDataStore {
    var currentPokemon: Pokemon? { get }
}

class PokemonAbilitiesInteractor: PokemonAbilitiesDataStore {
    private var presenter: PokemonAbilitiesPresentationLogic?
    var currentPokemon: Pokemon?
    
    init(presenter: PokemonAbilitiesPresentationLogic?) {
        self.presenter = presenter
    }
}

extension PokemonAbilitiesInteractor: PokemonAbilitiesBusinessLogic {
    func getCurrentPokemonAbilities() {
        presenter?.presentPokemonAbilities(response: .init(pokemon: currentPokemon))
    }
}
