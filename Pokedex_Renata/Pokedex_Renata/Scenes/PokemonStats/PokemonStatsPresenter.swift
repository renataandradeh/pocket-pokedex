//
//  PokemonStatsPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonStatsPresentationLogic {
    func presentPokemonStats(response: PokemonStatsModels.DisplayStats.Response)
}

class PokemonStatsPresenter {
    private weak var viewController: PokemonStatsDisplayLogic?
    
    init(viewController: PokemonStatsDisplayLogic) {
        self.viewController = viewController
    }
}

//  MARK: - PokemonStatsPresentationLogic
extension PokemonStatsPresenter: PokemonStatsPresentationLogic {
    func presentPokemonStats(response: PokemonStatsModels.DisplayStats.Response) {
        var baseStats: [BaseStat] = []
        guard let pokemon = response.pokemon else { return }
        for stat in pokemon.stats {
            baseStats.append(BaseStat(name: stat.stat.name, baseStat: stat.baseStat))
        }
        viewController?.displayPokemonStats(viewModel: .init(baseStats: baseStats))
    }
}
