//
//  PokemonInfoFactoryTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoFactoryTests: XCTest {
    func test_makeController_returns_a_PokemonInfoViewController() {
        let sut = PokemonInfoFactory.makeController(currentPokemon: Seeds.dummyPokemon, infoType: .games)
        XCTAssertNotNil(sut as? PokemonInfoViewController)
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
}
