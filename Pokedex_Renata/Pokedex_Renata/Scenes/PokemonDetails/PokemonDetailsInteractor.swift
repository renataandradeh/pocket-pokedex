//
//  PokemonDetailsInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonDetailsBusinessLogic {
    func fetchCurrentPokemonDetails()
    func favoritePokemon()
}

protocol PokemonDetailsDataStore {
    var currentPokemon: Pokemon? { get }
}

class PokemonDetailsInteractor: PokemonDetailsDataStore {
    private var worker: PokemonDetailsWorkLogic?
    private var presenter: PokemonDetailsPresenter?
    var currentPokemon: Pokemon?
    
    init(presenter: PokemonDetailsPresenter, worker: PokemonDetailsWorkLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension PokemonDetailsInteractor: PokemonDetailsBusinessLogic {
    func fetchCurrentPokemonDetails() {
        presenter?.presentPokemonDetails(response: .init(currentPokemon: currentPokemon))
    }
    
    func favoritePokemon() {
        worker?.likePokemon(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            //  TODO: present an error
            case .success:
                self.addToFavorites()
            }
        })
    }
    
    private func addToFavorites() {
        guard let worker = worker, let currentPokemon = currentPokemon else { return }
        let addedToFavorites = worker.addToFavorites(pokemon: currentPokemon)
        presenter?.presentAddedToFavorites(response: .init(wasAdded: addedToFavorites))
    }
}
