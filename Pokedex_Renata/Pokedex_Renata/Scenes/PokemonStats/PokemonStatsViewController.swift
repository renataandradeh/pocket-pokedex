//
//  PokemonStatsViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonStatsDisplayLogic: AnyObject {
    func displayPokemonStats(viewModel: PokemonStatsModels.DisplayStats.ViewModel)
}

class PokemonStatsViewController: UIViewController {
    private var interactor: PokemonStatsBusinessLogic?
    
    override func loadView() {
        view = PokemonStatsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getCurrentPokemonStats()
    }
    
    func setup(interactor: PokemonStatsBusinessLogic) {
        self.interactor = interactor
    }
}

//  MARK: - PokemonStatsDisplayLogic
extension PokemonStatsViewController: PokemonStatsDisplayLogic {
    func displayPokemonStats(viewModel: PokemonStatsModels.DisplayStats.ViewModel) {
        guard let view = view as? PokemonStatsView else { return }
        view.update(viewModel: viewModel)
    }
}
