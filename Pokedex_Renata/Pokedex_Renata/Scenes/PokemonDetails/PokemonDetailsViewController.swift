//
//  PokemonDetailsViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 16/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonDetailsDisplayLogic: AnyObject {
    func displayPokemonDetails(viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel)
    func displayAddedToFavorites(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel)
    func displayAddingToFavoritesError(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel)
}

class PokemonDetailsViewController: UIViewController {
    private var interactor: PokemonDetailsBusinessLogic?
    private var router: (PokemonDetailsDataPassing & PokemonDetailsRoutingLogic)?
    
    override func loadView() {
        view = PokemonDetailsView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCurrentPokemonDetails()
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
    func displayPokemonDetails(viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel) {
        guard let view = view as? PokemonDetailsView else { return }
        view.update(viewModel: viewModel)
    }
    
    func displayAddedToFavorites(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel) {
        guard let view = view as? PokemonDetailsView, let isFavorite = viewModel.isFavorite else { return }
        view.set(isFavorite: isFavorite)
        view.setAddToFavoritesButton()
    }
    
    func displayAddingToFavoritesError(viewModel: PokemonDetailsModels.DisplayAddedToFavorites.ViewModel) {
        guard let errorAlert = viewModel.errorAlert, let view = view as? PokemonDetailsView else { return }
        view.setAddToFavoritesButton()
        present(errorAlert, animated: true)
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
        guard let view = view as? PokemonDetailsView else { return }
        view.setActivityIndicatorItem()
        interactor?.favoritePokemon()
    }
    
    func didCreateTabBar(item: UIBarButtonItem) {
        navigationItem.rightBarButtonItem = nil
        navigationItem.rightBarButtonItem = item
    }
}
