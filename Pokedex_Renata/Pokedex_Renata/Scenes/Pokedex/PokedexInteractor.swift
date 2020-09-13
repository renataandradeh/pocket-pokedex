//
//  PokedexInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokedexBusinessLogic {
    func fetchPokemonList(request: PokedexModels.FetchPokemonList.Request)
}

protocol PokedexDataStore {
    
}

class PokedexInteractor: PokedexDataStore {
    private var presenter: PokedexPresentationLogic?
    private var worker: PokedexAPIClient?
    
    init(presenter: PokedexPresentationLogic, worker: PokedexAPIClient) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension PokedexInteractor: PokedexBusinessLogic {
    func fetchPokemonList(request: PokedexModels.FetchPokemonList.Request) {
        worker?.fetchPokedex(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pokemonList):
                self.presenter?.presentPokemonList(
                    response: PokedexModels.FetchPokemonList.Response(pokemonList: pokemonList?.results ?? [])
                )
            }
        })
    }
}
