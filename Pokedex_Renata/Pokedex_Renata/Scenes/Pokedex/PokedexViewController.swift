//
//  PokedexViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokedexDisplayLogic: AnyObject {
    func displayPokemonList(viewModel: PokedexModels.FetchPokemonList.ViewModel)
}

class PokedexViewController: UIViewController {
    private var interactor: PokedexBusinessLogic?
    
    override func loadView() {
        view = PokedexView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        interactor?.fetchPokemonList(request: PokedexModels.FetchPokemonList.Request())
    }
    
    func setup(interactor: PokedexBusinessLogic? = nil) {
        self.interactor = interactor
    }
}

extension PokedexViewController: PokedexDisplayLogic {
    func displayPokemonList(viewModel: PokedexModels.FetchPokemonList.ViewModel) {
        guard let pokedexView = view as? PokedexView else { return }
        pokedexView.updateView(withViewModel: viewModel)
    }
}
