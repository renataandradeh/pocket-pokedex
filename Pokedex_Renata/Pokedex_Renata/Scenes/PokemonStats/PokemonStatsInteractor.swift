//
//  PokemonStatsInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonStatsBusinessLogic {
    func getCurrentPokemonStats()
}

protocol PokemonStatsDataStore {
    var currentPokemon: Pokemon? { get }
}

class PokemonStatsInteractor: PokemonStatsDataStore {
    private var presenter: PokemonStatsPresentationLogic?
    var currentPokemon: Pokemon?
    
    init(presenter: PokemonStatsPresentationLogic?) {
        self.presenter = presenter
    }
}

extension PokemonStatsInteractor: PokemonStatsBusinessLogic {
    func getCurrentPokemonStats() {
        presenter?.presentPokemonStats(response: .init(pokemon: currentPokemon))
    }
}
