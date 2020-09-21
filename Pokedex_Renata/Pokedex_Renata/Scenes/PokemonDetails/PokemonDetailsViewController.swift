//
//  PokemonDetailsViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 16/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonDetailsDisplayLogic: AnyObject {
    func displayAddedToFavorites(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel)
}

class PokemonDetailsViewController: UIViewController {
    var currentPokemon: Pokemon?
    private var interactor: PokemonDetailsBusinessLogic?
    private var router: (PokemonDetailsDataPassing & PokemonDetailsRoutingLogic)?
    
    override func loadView() {
        view = PokemonDetailsView(
            delegate: self,
            viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel(pokemon: router?.dataStore?.currentPokemon)
        )
    }

    func setup(
        interactor: PokemonDetailsBusinessLogic,
        router: (PokemonDetailsDataPassing & PokemonDetailsRoutingLogic)?
    ) {
        self.interactor = interactor
        self.router = router
    }
}

//  MARK: - PokemonDetailsDisplayLogic
extension PokemonDetailsViewController: PokemonDetailsDisplayLogic {
    func displayAddedToFavorites(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel) {
        present(viewModel.alert, animated: true)
    }
}

//  MARK: - PokemonDetailsViewDelegate
extension PokemonDetailsViewController: PokemonDetailsViewDelegate {
    func didTapAbilities() {
        router?.routeToAbilitiesScreen()
    }
    
    func didTapStats() {
        router?.routeToStatsScreen()
    }
    
    func didTapGames() {
        router?.routeToGamesScreen()
    }
    
    func didTapAddToFavorites() {
        interactor?.favoritePokemon()
    }
    
    func didCreateTabBar(item: UIBarButtonItem) {
        navigationItem.rightBarButtonItem = item
    }
}
