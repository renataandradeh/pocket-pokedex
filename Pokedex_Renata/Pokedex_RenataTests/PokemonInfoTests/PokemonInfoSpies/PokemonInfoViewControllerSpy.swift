//
//  PokemonInfoViewControllerSpy.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoViewControllerSpy {
    var displayPokemonInfoCalled = false
}

extension PokemonInfoViewControllerSpy: PokemonInfoDisplayLogic {
    func displayPokemonInfo(viewModel: PokemonInfoModels.DisplayPokemonInfo.ViewModel) {
        displayPokemonInfoCalled = true
    }
}
