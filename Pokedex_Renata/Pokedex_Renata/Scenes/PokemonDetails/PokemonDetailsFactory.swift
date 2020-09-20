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
        let interactor = PokemonDetailsInteractor()
        interactor.currentPokemon = currentPokemon
        let router = PokemonDetailsRouter(dataStore: interactor, viewController: viewController)
//        viewController.setup(currentPokemon: currentPokemon!)
        viewController.setup(interactor: interactor, router: router)
        return viewController
    }
}
