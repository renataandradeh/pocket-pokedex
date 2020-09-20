//
//  PokemonDetailsRouter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonDetailsRoutingLogic {
    func routeToStatsScreen()
}

protocol PokemonDetailsDataPassing {
    var dataStore: PokemonDetailsDataStore? { get }
}

class PokemonDetailsRouter: PokemonDetailsDataPassing, PokemonDetailsRoutingLogic {
    var dataStore: PokemonDetailsDataStore?
    private weak var viewController: PokemonDetailsViewController?
    
    init(dataStore: PokemonDetailsDataStore?, viewController: PokemonDetailsViewController) {
        self.dataStore = dataStore
        self.viewController = viewController
    }
    
    func routeToStatsScreen() {
        print("routing to stats screen")
    }
}
