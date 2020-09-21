//
//  PokemonStatsFactory.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokemonStatsFactory {
    static func makeController(currentPokemon: Pokemon?) -> UIViewController {
        let viewController = PokemonStatsViewController()
        let presenter = PokemonStatsPresenter(viewController: viewController)
        let interactor = PokemonStatsInteractor(presenter: presenter)
        interactor.currentPokemon = currentPokemon
        viewController.setup(interactor: interactor)
        return viewController
    }
}
