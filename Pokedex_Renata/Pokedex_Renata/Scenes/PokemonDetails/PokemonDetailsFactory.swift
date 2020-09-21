//
//  PokemonDetailsFactory.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 16/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokemonDetailsFactory {
    static func makeController(currentPokemon: Pokemon?) -> UIViewController {
        let viewController = PokemonDetailsViewController()
        let worker = PokemonDetailsWorker()
        let presenter = PokemonDetailsPresenter(viewController: viewController)
        let interactor = PokemonDetailsInteractor(presenter: presenter, worker: worker)
        interactor.currentPokemon = currentPokemon
        let router = PokemonDetailsRouter(dataStore: interactor, viewController: viewController)
        viewController.setup(interactor: interactor, router: router)
        return viewController
    }
}
