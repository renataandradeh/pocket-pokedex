//
//  PokemonGamesPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonGamesPresentationLogic {
    func presentPokemonGames(response: PokemonGamesModels.DisplayGamesVersionsNames.Response)
}

class PokemonGamesPresenter {
    private weak var viewController: PokemonGamesDisplayLogic?
    
    init(viewController: PokemonGamesDisplayLogic) {
        self.viewController = viewController
    }
}

//  MARK: - PokemonGamesPresentationLogic
extension PokemonGamesPresenter: PokemonGamesPresentationLogic {
    func presentPokemonGames(response: PokemonGamesModels.DisplayGamesVersionsNames.Response) {
        var gameVersionsNames: [String] = []
        guard let pokemon = response.pokemon else { return }
        for game in pokemon.gameIndices {
            gameVersionsNames.append(game.version.name)
            viewController?.displayPokemonGames(viewModel: .init(gameVersionsNames: gameVersionsNames))
        }
    }
}
