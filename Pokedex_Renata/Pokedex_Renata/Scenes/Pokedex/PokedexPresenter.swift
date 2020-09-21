//
//  PokedexPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokedexPresentationLogic {
    func presentPokemonList(response: PokedexModels.FetchPokemonList.Response)
}

class PokedexPresenter {
    private weak var viewController: PokedexDisplayLogic?
    
    init(viewController: PokedexDisplayLogic) {
        self.viewController = viewController
    }
}

//  MARK: - PokedexPresentationLogic
extension PokedexPresenter: PokedexPresentationLogic {
    func presentPokemonList(response: PokedexModels.FetchPokemonList.Response) {
        var list: [PokemonItem] = []
        
        for pokemon in response.pokemons {
            var tags: [TagLabel] = []
            let names = getTypesNames(for: pokemon)
            for name in names {
                tags.append(TagLabel(title: name))
            }
            list.append(
                PokemonItem(
                    name: pokemon.name,
                    url: URL(string: pokemon.sprites.other?.officialArtwork.frontDefault ?? "")!,
                    tags: tags,
                    itemColor: tags.first?.backgroundColor ?? .white
                )
            )
        }
        viewController?.displayPokemonList(
            viewModel: PokedexModels.FetchPokemonList.ViewModel(pokemons: list)
        )
    }
}

//  MARK: - Helpers
extension PokedexPresenter {
    private func getTypesNames(for pokemon: Pokemon) -> [String] {
        var names: [String] = []
        for type in pokemon.types {
            names.append(type.type.name)
        }
        return names
    }
}
