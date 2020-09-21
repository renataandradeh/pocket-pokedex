//
//  PokemonGamesInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonGamesBusinessLogic {
    func getCurrentPokemonGames()
}

protocol PokemonGamesDataStore {
    var currentPokemon: Pokemon? { get }
}

class PokemonGamesInteractor: PokemonGamesDataStore {
    private var presenter: PokemonGamesPresentationLogic?
    var currentPokemon: Pokemon?
    
    init(presenter: PokemonGamesPresentationLogic?) {
        self.presenter = presenter
    }
}

extension PokemonGamesInteractor: PokemonGamesBusinessLogic {
    func getCurrentPokemonGames() {
        presenter?.presentPokemonGames(response: .init(pokemon: currentPokemon))
    }
}
