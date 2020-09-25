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
    private var router: (PokedexDataPassing & PokedexRoutingLogic)?
    
    override func loadView() {
        view = PokedexView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchPokemonList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil
        )
    }
    
    func setup(
        interactor: PokedexBusinessLogic? = nil,
        router: (PokedexDataPassing & PokedexRoutingLogic)?
    ) {
        self.interactor = interactor
        self.router = router
    }
}

extension PokedexViewController: PokedexDisplayLogic {
    func displayPokemonList(viewModel: PokedexModels.FetchPokemonList.ViewModel) {
        guard let pokedexView = view as? PokedexView else { return }
        pokedexView.update(viewModel: viewModel)
    }
}

//  MARK: - PokedexViewDelegate
extension PokedexViewController: PokedexViewDelegate {
    func didCreate(item: UIBarButtonItem) {
        navigationItem.leftBarButtonItem = item
    }
    
    func didScrollToTheEnd() {
        interactor?.fetchPokemonList()
    }
    
    func didSelectPokemonAt(indexPath: IndexPath, withQuery query: String?) {
        interactor?.setCurrentPokemon(at: indexPath.row, withQuery: query)
        router?.routeToDetailsScreen()
    }
    
}
