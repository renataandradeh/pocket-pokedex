//
//  PokedexInteractorTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex_Renata

class PokedexInteractorTests: XCTestCase {
    var sut: PokedexInteractor!
    var presenterSpy: PokedexPresenterSpy!
    var workerSpy: PokedexWorkerSpy!
    
    override func setUp() {
        super.setUp()
        presenterSpy = PokedexPresenterSpy()
        workerSpy = PokedexWorkerSpy()
        sut = PokedexInteractor(presenter: presenterSpy, worker: workerSpy)
    }
    
    func test_fetchPokemonList_calls_worker_to_fetch_the_pokemon_list() {
        sut.fetchPokemonList()
        XCTAssertTrue(workerSpy.fetchPokemonListCalled)
    }
    
    func test_currentPokemon_is_equal_to_dummyPokemon_after_setCurrent_method_is_called() {
        sut.setCurrent(pokemon: Seeds.dummyPokemon)
        XCTAssertEqual(sut.currentPokemon, Seeds.dummyPokemon)
    }
    
    func test_getPokemon_returns_nil_when_passing_a_invalid_index() {
        sut.pokemons = Seeds.dummyPokemons
        XCTAssertNil(sut.getPokemon(at: -1))
    }
    
    func test_getPokemon_returns_a_pokemon_when_passing_a_valid_index() {
        sut.pokemons = Seeds.dummyPokemons
        XCTAssertNotNil(sut.getPokemon(at: 0))
    }
    
    override func tearDown() {
        presenterSpy = nil
        workerSpy = nil
        sut = nil
        super.tearDown()
    }
}

//  MARK: - Helper data
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
