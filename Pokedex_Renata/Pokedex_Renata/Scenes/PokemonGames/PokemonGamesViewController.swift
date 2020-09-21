//
//  PokemonGamesViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonGamesDisplayLogic: AnyObject {
    func displayPokemonGames(viewModel: PokemonGamesModels.DisplayGamesVersionsNames.ViewModel)
}

class PokemonGamesViewController: UIViewController {
    private var interactor: PokemonGamesBusinessLogic?
    
    override func loadView() {
        view = PokemonGamesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getCurrentPokemonGames()
    }
    
    func setup(interactor: PokemonGamesBusinessLogic) {
        self.interactor = interactor
    }
}

//MARK: - PokemonGamesDisplayLogic
extension PokemonGamesViewController: PokemonGamesDisplayLogic {
    func displayPokemonGames(viewModel: PokemonGamesModels.DisplayGamesVersionsNames.ViewModel) {
        guard let view = view as? PokemonGamesView else { return }
        view.update(viewModel: viewModel)
    }
}
