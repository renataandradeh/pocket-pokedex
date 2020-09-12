//
//  PokedexWorkerTests.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import XCTest
@testable import Pokedex_Renata

class PokedexWorkerTests: XCTestCase {
    
    func test_fetchPokedex_should_complete_with_success_when_urlSession_has_valid_data() {
        let sut = PokedexWorker(session: WorkerTestsFactory.makeSessionMock())
        
        URLProtocolMock.set(url: Seeds.Dummy.url!, data: Seeds.Mock.data)
        
        let exp = expectation(description: "waiting")
        sut.fetchPokedex(url: Seeds.Dummy.url!) { (result) in
            switch result {
            case .failure: XCTFail()
            case .success(let data): XCTAssertEqual(data!, Seeds.Mock.expectedModel)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_fetchPokedex_should_complete_with_error_when_urlSession_has_invalid_data() {
        let sut = PokedexWorker(session: WorkerTestsFactory.makeSessionMock())
        
        URLProtocolMock.set(url: Seeds.Dummy.url!, error: Seeds.Dummy.error)
        
        let exp = expectation(description: "waiting")
        sut.fetchPokedex(url: Seeds.Dummy.url!) { (result) in
            switch result {
            case .failure(let error): XCTAssertEqual(error, Seeds.Dummy.error)
            case .success: XCTFail()
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
}

//  MARK: - Helper Data
fileprivate struct Seeds {
    struct Dummy {
        static let error: PokedexWorkerError = .unavailable
        static let url = URL(string: "https://pokeapi.co/api/v2/")
    }
    
    struct Mock {
        static let expectedModel = Pokedex(count: 0, next: "", previous: "", results: [])
        static let data = try! JSONEncoder().encode(expectedModel)
    }
}
