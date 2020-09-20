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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(currentPokemon: Pokemon) {
        self.currentPokemon = currentPokemon
    }
    
    override func loadView() {
        view = PokemonDetailsView(viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel(pokemon: currentPokemon))
    }
}
