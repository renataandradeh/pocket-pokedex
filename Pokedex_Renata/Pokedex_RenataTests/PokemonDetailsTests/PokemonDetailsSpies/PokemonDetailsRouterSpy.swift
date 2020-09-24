//
//  PokemonDetailsRouterSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokemonDetailsRouterSpy: PokemonDetailsDataPassing {
    var dataStore: PokemonDetailsDataStore?
    
    var routeToAbilitiesScreenCalled = false
    var routeToStatsScreenCalled = false
    var routeToGamesScreenCalled = false
}

extension PokemonDetailsRouterSpy: PokemonDetailsRoutingLogic {
    func routeToAbilitiesScreen() {
        routeToAbilitiesScreenCalled = true
    }
    
    func routeToStatsScreen() {
        routeToStatsScreenCalled = true
    }
    
    func routeToGamesScreen() {
        routeToGamesScreenCalled = true
    }
}
