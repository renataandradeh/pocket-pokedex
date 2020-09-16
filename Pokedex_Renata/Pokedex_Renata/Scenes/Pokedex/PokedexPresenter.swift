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
        var list: [Reference] = []
        for pokemon in response.pokemons {
            list.append(Reference(name: pokemon.name, url: pokemon.sprites.frontDefault))
        }
        viewController?.displayPokemonList(
            viewModel: PokedexModels.FetchPokemonList.ViewModel(pokemons: list)
        )
    }
}
