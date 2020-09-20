//
//  PokemonDetailsInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonDetailsBusinessLogic {
    
}

protocol PokemonDetailsDataStore {
    var currentPokemon: Pokemon? { get }
}

class PokemonDetailsInteractor: PokemonDetailsDataStore {
    var currentPokemon: Pokemon?
}

extension PokemonDetailsInteractor: PokemonDetailsBusinessLogic {
    
}
