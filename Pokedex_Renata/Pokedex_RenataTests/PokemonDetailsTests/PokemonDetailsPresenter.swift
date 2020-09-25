//
//  PokemonDetailsPresenter.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonDetailsPresenterTests: XCTestCase {
    var sut: PokemonDetailsPresenter!
    var viewControllerSpy: PokemonDetailsViewControlllerSpy!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = PokemonDetailsViewControlllerSpy()
        sut = PokemonDetailsPresenter(viewController: viewControllerSpy)
    }
    
    func test_presentPokemonDetails_calls_viewController_to_display_the_pokemon_details() {
        sut.presentPokemonDetails(response: Seeds.dummyDetailsResponse)
        XCTAssertTrue(viewControllerSpy.displayPokemonDetailsCalled)
    }
    
    override func tearDown() {
        viewControllerSpy = nil
        sut = nil
        super.tearDown()
    }
}

//  MARK: - Helper data
fileprivate struct Seeds {
    static let dummyDetailsResponse: PokemonDetailsModels.DisplayPokemonDetails.Response = .init(
        currentPokemon: dummyPokemon,
        isFavorite: true
    )

    static let dummyPokemon = Pokemon(
        abilities: [],
        gameIndices: [],
        height: 10,
        id: 10,
        name: "Test",
        order: 1,
        sprites: nil,
        stats: [],
        types: [],
        weight: 10
    )
}

