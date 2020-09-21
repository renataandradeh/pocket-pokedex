//
//  PokemonAbilitiesFactory.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokemonAbilitiesFactory {
    static func makeController(currentPokemon: Pokemon?) -> UIViewController {
        let viewController = PokemonAbilitiesViewController()
        let presenter = PokemonAbilitiesPresenter(viewController: viewController)
        let interactor = PokemonAbilitiesInteractor(presenter: presenter)
        interactor.currentPokemon = currentPokemon
        viewController.setup(interactor: interactor)
        return viewController
    }
}
