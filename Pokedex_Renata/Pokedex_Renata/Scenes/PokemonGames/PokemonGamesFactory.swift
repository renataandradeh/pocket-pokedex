//
//  PokemonGamesFactory.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokemonGamesFactory {
    static func makeController(currentPokemon: Pokemon?) -> UIViewController {
        let viewController = PokemonGamesViewController()
        let presenter = PokemonGamesPresenter(viewController: viewController)
        let interactor = PokemonGamesInteractor(presenter: presenter)
        interactor.currentPokemon = currentPokemon
        viewController.setup(interactor: interactor)
        return viewController
    }
}

