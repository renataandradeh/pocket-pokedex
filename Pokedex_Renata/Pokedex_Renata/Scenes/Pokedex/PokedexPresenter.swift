//
//  PokedexPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokedexPresentationLogic {
    func presentPokemonList(response: PokedexModels.FetchPokemonList.Response)
}

class PokedexPresenter {
    private weak var viewController: PokedexDisplayLogic?
    
    init(viewController: PokedexDisplayLogic) {
        self.viewController = viewController
    }
}

extension PokedexPresenter: PokedexPresentationLogic {
    func presentPokemonList(response: PokedexModels.FetchPokemonList.Response) {
        var pokemonNames: [String] = []
        for pokemon in response.pokemonList {
            pokemonNames.append(pokemon.name)
        }
        viewController?.displayPokemonList(
            viewModel: PokedexModels.FetchPokemonList.ViewModel(pokemonNames: pokemonNames)
        )
    }
}
