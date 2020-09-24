//
//  PokedexViewControllerTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 24/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex_Renata

class PokedexViewControllerTests: XCTestCase {
    var sut: PokedexViewController!
    var interactorSpy: PokedexInteractorSpy!
    var routerSpy: PokedexRouterSpy!
    
    override func setUp() {
        super.setUp()
        interactorSpy = PokedexInteractorSpy()
        routerSpy = PokedexRouterSpy()
        sut = PokedexViewController()
        sut.setup(interactor: interactorSpy, router: routerSpy)
    }
    
    func test_viewDidLoad_calls_interactor_to_fetch_the_pokemon_list() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.fetchPokemonListCalled)
    }
    
    override func tearDown() {
        interactorSpy = nil
        routerSpy = nil
        sut = nil
        super.setUp()
    }
}
