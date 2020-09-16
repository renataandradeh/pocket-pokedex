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
    var nextPage: URL? { get }
    var pokemonList: [Pokemon]? { get }
}

class PokedexInteractor: PokedexDataStore {
    private var presenter: PokedexPresentationLogic?
    private var worker: PokedexAPIClient?
    
    var nextPage: URL?
    var pokemonList: [Pokemon]?
    var isFetchInProgress: Bool
    
    init(presenter: PokedexPresentationLogic, worker: PokedexAPIClient) {
        self.presenter = presenter
        self.worker = worker
        self.isFetchInProgress = false
    }
}

extension PokedexInteractor: PokedexBusinessLogic {
    func fetchPokemonList(request: PokedexModels.FetchPokemonList.Request) {
        guard !isFetchInProgress else { return }
        isFetchInProgress = true
        worker?.fetchPokemonList(nextPageURL: nextPage, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            //  TODO: present an error
            case .success(let nextPage, let list):
                self.nextPage = URL(string: nextPage ?? "")
                if let list = list {
                    self.pokemonList = list
                    self.presenter?.presentPokemonList(
                        response: PokedexModels.FetchPokemonList.Response(pokemons: list)
                    )
                }
            }
            self.isFetchInProgress = false
        })
    }
}
