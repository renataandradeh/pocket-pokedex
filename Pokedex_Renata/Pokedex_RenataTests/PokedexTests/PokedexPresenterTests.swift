//
//  PokedexPresenterTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex_Renata

class PokedexPresenterTests: XCTestCase {
    var sut: PokedexPresenter!
    var viewControllerSpy: PokedexViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = PokedexViewControllerSpy()
        sut = PokedexPresenter(viewController: viewControllerSpy)
    }
    
    func test_presentPokemonList_calls_the_displayPokemonList_viewController_method() {
        sut.presentPokemonList(response: .init(pokemons: Seeds.dummyPokemons))
        XCTAssertTrue(viewControllerSpy.displayPokemonListCalled)
    }
    
    override func tearDown() {
        viewControllerSpy = nil
        sut = nil
        super.tearDown()
    }
}

//  MARK: - Helper Data
fileprivate struct Seeds {
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
    static let dummyPokemons = [dummyPokemon, dummyPokemon]
}
