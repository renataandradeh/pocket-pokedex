//
//  PokemonInfoPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonInfoPresentationLogic {
    func presentPokemonGames(response: PokemonInfoModels.DisplayPokemonInfo.Response)
    func presentPokemonStats(response: PokemonInfoModels.DisplayPokemonInfo.Response)
    func presentPokemonAbilities(response: PokemonInfoModels.DisplayPokemonInfo.Response)
}

class PokemonInfoPresenter {
    private weak var viewController: PokemonInfoDisplayLogic?
    
    init(viewController: PokemonInfoDisplayLogic) {
        self.viewController = viewController
    }
}

//  MARK: - PokemonInfoPresentationLogic
extension PokemonInfoPresenter: PokemonInfoPresentationLogic {
    func presentPokemonGames(response: PokemonInfoModels.DisplayPokemonInfo.Response) {
        var pokemonGamesList: [PokemonInfo] = []
        guard let pokemon = response.pokemon else { return }
        for game in pokemon.gameIndices {
            pokemonGamesList.append(PokemonInfo(title: game.version.name, value: nil))
            viewController?.displayPokemonInfo(viewModel:
                .init(
                    pageTitle: "games",
                    infoList: pokemonGamesList
                )
            )
        }
    }
    
    func presentPokemonStats(response: PokemonInfoModels.DisplayPokemonInfo.Response) {
        var baseStats: [PokemonInfo] = []
        guard let pokemon = response.pokemon else { return }
        for stat in pokemon.stats {
            baseStats.append(PokemonInfo(title: stat.stat.name, value: stat.baseStat))
        }
        viewController?.displayPokemonInfo(viewModel:
            .init(
                pageTitle: "base stats",
                infoList: baseStats
            )
        )
    }
    
    func presentPokemonAbilities(response: PokemonInfoModels.DisplayPokemonInfo.Response) {
        var abilities: [PokemonInfo] = []
        guard let pokemon = response.pokemon else { return }
        for ability in pokemon.abilities {
            abilities.append(PokemonInfo(title: ability.ability.name, value: ability.slot))
        }
        viewController?.displayPokemonInfo(viewModel:
            .init(
                pageTitle: "abilities",
                infoList: abilities
            )
        )
    }
}
