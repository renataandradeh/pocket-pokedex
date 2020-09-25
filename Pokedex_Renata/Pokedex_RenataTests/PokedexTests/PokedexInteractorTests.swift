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
    
    override func tearDown() {
        presenterSpy = nil
        workerSpy = nil
        sut = nil
        super.tearDown()
    }
}
