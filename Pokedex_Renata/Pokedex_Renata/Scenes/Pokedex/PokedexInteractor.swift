//
//  PokedexInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokedexBusinessLogic {
    func fetchPokemonList()
    func setCurrentPokemon(at index: Int, withQuery query: String?)
}

protocol PokedexDataStore {
    var nextPage: URL? { get }
    var pokemons: [Pokemon]? { get }
    var currentPokemon: Pokemon? { get }
}

class PokedexInteractor: PokedexDataStore {
    private let presenter: PokedexPresentationLogic
    private let worker: PokedexWorkLogic
    
    var nextPage: URL?
    var pokemons: [Pokemon]?
    var currentPokemon: Pokemon?
    var isFetchInProgress: Bool
    
    init(presenter: PokedexPresentationLogic, worker: PokedexWorkLogic) {
        self.presenter = presenter
        self.worker = worker
        self.pokemons = []
        self.isFetchInProgress = false
    }
}

extension PokedexInteractor: PokedexBusinessLogic {
    func setCurrentPokemon(at index: Int, withQuery query: String?) {
        guard let pokemon = getPokemon(at: index, withQuery: query) else { return }
        currentPokemon = pokemon
    }
    
    private func getPokemon(at index: Int, withQuery query: String?) -> Pokemon? {
        guard let pokemons = pokemons, index >= 0, index < pokemons.count else { return nil }
        if let query = query, !query.isEmpty {
            let filteredPokemons = pokemons.filter({ pokemon -> Bool in
                return pokemon.name.lowercased().contains(query.lowercased())
            })
            return filteredPokemons[index]
        }
        return pokemons[index]
    }
    
    func fetchPokemonList() {
        guard !isFetchInProgress else { return }
        isFetchInProgress = true
        worker.fetchPokemonList(nextPageURL: nextPage, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            //  TODO: present an error
            case .success(let nextPage, let list):
                self.nextPage = URL(string: nextPage ?? "")
                if let list = list {
                    self.pokemons?.append(contentsOf: list)
                    self.presenter.presentPokemonList(
                        response: PokedexModels.FetchPokemonList.Response(pokemons: list)
                    )
                }
            }
            self.isFetchInProgress = false
        })
    }
}
