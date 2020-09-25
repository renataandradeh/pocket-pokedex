//
//  PokemonInfoInteractorTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoInteractorTests: XCTestCase {
    var sut: PokemonInfoInteractor!
    var presenterSpy: PokemonInfoPresenterSpy!
    
    override func setUp() {
        super.setUp()
        presenterSpy = PokemonInfoPresenterSpy()
        sut = PokemonInfoInteractor(presenter: presenterSpy)
    }
    
    func test_getCurrentPokemonInfo_calls_presenter_to_present_abilities_when_passing_type_abilities() {
        sut.getCurrentPokemonInfo(type: .abilities)
        XCTAssertTrue(presenterSpy.presentPokemonAbilitiesCalled)
    }
    
    func test_getCurrentPokemonInfo_calls_presenter_to_present_games_when_passing_type_games() {
        sut.getCurrentPokemonInfo(type: .games)
        XCTAssertTrue(presenterSpy.presentPokemonGamesCalled)
    }
    
    func test_getCurrentPokemonInfo_calls_presenter_to_present_stats_when_passing_type_games() {
        sut.getCurrentPokemonInfo(type: .stats)
        XCTAssertTrue(presenterSpy.presentPokemonStatsCalled)
    }
    
    override func tearDown() {
        presenterSpy = nil
        sut = nil
        super.tearDown()
    }
}
    
