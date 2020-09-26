//
//  PokemonInfoViewControllerTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonInfoViewControllerTests: XCTestCase {
    var sut: PokemonInfoViewController!
    var interactorSpy: PokemonInfoInteractorSpy!
    
    override func setUp() {
        super.setUp()
        interactorSpy = PokemonInfoInteractorSpy()
        sut = PokemonInfoViewController()
        sut.setup(interactor: interactorSpy, infoType: .games)
    }
    
    func test_viewDidLoad_calls_interactor_to_get_the_current_pokemon_info() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.getCurrentPokemonInfoCalled)
    }
    
    override func tearDown() {
        interactorSpy = nil
        sut = nil
        super.tearDown()
    }
}
