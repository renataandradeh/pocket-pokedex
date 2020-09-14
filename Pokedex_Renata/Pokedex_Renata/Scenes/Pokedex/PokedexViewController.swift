//
//  PokedexViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokedexDisplayLogic: AnyObject {
    func displayPokemonReferenceList(viewModel: PokedexModels.FetchPokemonReferenceList.ViewModel)
}

class PokedexViewController: UIViewController {
    private var interactor: PokedexBusinessLogic?
    
    override func loadView() {
        view = PokedexView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        interactor?.fetchPokemonReferenceList(request: PokedexModels.FetchPokemonReferenceList.Request())
    }
    
    func setup(interactor: PokedexBusinessLogic? = nil) {
        self.interactor = interactor
    }
}

extension PokedexViewController: PokedexDisplayLogic {
    func displayPokemonReferenceList(viewModel: PokedexModels.FetchPokemonReferenceList.ViewModel) {
        guard let pokedexView = view as? PokedexView else { return }
        pokedexView.updateView(withViewModel: viewModel)
    }
}

extension PokedexViewController: PokedexViewDelegate {
    func didScrollToTheEnd() {
        interactor?.fetchPokemonReferenceList(request: PokedexModels.FetchPokemonReferenceList.Request())
    }
}
