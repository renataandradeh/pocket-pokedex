//
//  PokedexWorkerSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
@testable import Pokedex_Renata

class PokedexWorkerSpy {
    var fetchPokedexCalled = false
    var fetchPokemonCalled = false
    var fetchPokemonListCalled = false
    
    var isSuccess: Bool
    var completion: ((PokemonListWorkerResult) -> Void)?
    
    init(isSuccess: Bool = false) {
        self.isSuccess = isSuccess
    }
}

extension PokedexWorkerSpy: PokedexWorkLogic {
    func fetchPokedex(nextPageURL: URL?, completion: @escaping (PokedexWorkerResult) -> Void) {
        fetchPokedexCalled = true
    }
    
    func fetchPokemon(url: URL?, completion: @escaping (PokemonWorkerResult) -> Void) {
        fetchPokemonCalled = true
    }
    
    func fetchPokemonList(nextPageURL: URL?, completion: @escaping (PokemonListWorkerResult) -> Void) {
        fetchPokemonListCalled = true
        if isSuccess {
            self.completion?(.success(nextPage: "", pokemonList: []))
        } else {
            self.completion?(.failure(.unavailable))
        }
    }
    
    func complete() {
        completion?(.failure(.invalidURL))
    }
}

