//
//  PokedexInfoPresenterTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoPresenterTests: XCTestCase {
    var sut: PokemonInfoPresenter!
    var viewControllerSpy: PokemonInfoViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = PokemonInfoViewControllerSpy()
        sut = PokemonInfoPresenter(viewController: viewControllerSpy)
    }
    
    func test_presentPokemonGames_calls_viewController_to_display_the_games_info() {
        sut.presentPokemonGames(response: .init(pokemon: Seeds.dummyPokemon))
        XCTAssertTrue(viewControllerSpy.displayPokemonInfoCalled)
    }
    
    func test_presentPokemonAbilities_calls_viewController_to_display_the_abilities_info() {
        sut.presentPokemonAbilities(response: .init(pokemon: Seeds.dummyPokemon))
        XCTAssertTrue(viewControllerSpy.displayPokemonInfoCalled)
    }
    
    func test_presentPokemonStats_calls_viewController_to_display_the_base_stats_info() {
        sut.presentPokemonStats(response: .init(pokemon: Seeds.dummyPokemon))
        XCTAssertTrue(viewControllerSpy.displayPokemonInfoCalled)
    }
    
    override func tearDown() {
        viewControllerSpy = nil
        sut = nil
        super.tearDown()
    }
}

//  MARK: - Helper data
fileprivate struct Seeds {
    static let dummyPokemon = Pokemon(
        abilities: [],
        gameIndices: [
            GameIndex(
                gameIndex: 0,
                version:
                Reference(name: "", url: "")
            )
        ],
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
