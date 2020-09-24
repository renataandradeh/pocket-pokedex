//
//  PokedexRouterSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

@testable import Pokedex_Renata

class PokedexRouterSpy: PokedexDataPassing {
    var dataStore: PokedexDataStore?

    var routeToDetailsScreenCalled = false
}

extension PokedexRouterSpy: PokedexRoutingLogic {
    func routeToDetailsScreen() {
        routeToDetailsScreenCalled = true
    }
}
