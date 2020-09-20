//
//  PokemonDetailsViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 16/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    var currentPokemon: Pokemon?
    private var interactor: PokemonDetailsBusinessLogic?
    private var router: (PokemonDetailsDataPassing & PokemonDetailsRoutingLogic)?

    func setup(currentPokemon: Pokemon) {
        self.currentPokemon = currentPokemon
    }
    
    func setup(
        interactor: PokemonDetailsBusinessLogic,
        router: (PokemonDetailsDataPassing & PokemonDetailsRoutingLogic)?
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    override func loadView() {
        view = PokemonDetailsView(
            delegate: self,
            viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel(pokemon: router?.dataStore?.currentPokemon)
        )
    }
}

extension PokemonDetailsViewController: PokemonDetailsViewDelegate {
    func didTapStatsButton() {
        router?.routeToStatsScreen()
    }
}
