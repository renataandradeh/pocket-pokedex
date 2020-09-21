//
//  PokemonAbilitiesViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonAbilitiesDisplayLogic: AnyObject {
    func displayPokemonAbilities(viewModel: PokemonAbilitiesModels.DisplayAbilities.ViewModel)
}

class PokemonAbilitiesViewController: UIViewController {
    private var interactor: PokemonAbilitiesBusinessLogic?
    
    override func loadView() {
        view = PokemonAbilitiesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getCurrentPokemonAbilities()
    }
    
    func setup(interactor: PokemonAbilitiesBusinessLogic) {
        self.interactor = interactor
    }
}

//MARK: - PokemonAbilitiesDisplayLogic
extension PokemonAbilitiesViewController: PokemonAbilitiesDisplayLogic {
    func displayPokemonAbilities(viewModel: PokemonAbilitiesModels.DisplayAbilities.ViewModel) {
        guard let view = view as? PokemonAbilitiesView else { return }
        view.update(viewModel: viewModel)
    }
}
