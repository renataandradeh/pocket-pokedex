//
//  PokedexRouter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 15/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokedexRoutingLogic {
    func navigateToDetailsScreen()
}

protocol PokedexDataPassing {
    var dataStore: PokedexDataStore? { get }
}

class PokedexRouter: PokedexDataPassing, PokedexRoutingLogic {
    var dataStore: PokedexDataStore?
    private weak var viewController: PokedexViewController?
    
    init(dataStore: PokedexDataStore, viewController: PokedexViewController) {
        self.dataStore = dataStore
        self.viewController = viewController
    }
    
    func navigateToDetailsScreen() {
        let vc = PokemonDetailsViewController()
        vc.pokemon = dataStore?.currentPokemon
        viewController?.present(vc, animated: true)
    }
}
