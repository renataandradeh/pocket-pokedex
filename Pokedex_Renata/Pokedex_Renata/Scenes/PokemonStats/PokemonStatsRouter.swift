//
//  PokemonStatsRouter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonStatsRoutingLogic {

}

protocol PokemonStatsDataPassing {
    var dataStore: PokemonStatsDataStore? { get }
}

class PokemonStatsRouter: PokemonStatsDataPassing, PokemonStatsRoutingLogic {
    var dataStore: PokemonStatsDataStore?
    private weak var viewController: PokemonStatsViewController?
    
    init(dataStore: PokemonStatsDataStore?, viewController: PokemonStatsViewController) {
        self.dataStore = dataStore
        self.viewController = viewController
    }
    
    func routeToStatsScreen() {
    }
}
