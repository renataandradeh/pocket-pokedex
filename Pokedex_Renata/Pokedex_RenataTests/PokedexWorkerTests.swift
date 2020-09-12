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
        URLProtocolMock.urls = [Seeds.Dummy.url: (nil, Seeds.Mock.data)]
        
        let sut = PokedexWorker(session: Seeds.makeSessionMock())
        
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
        URLProtocolMock.urls = [Seeds.Dummy.url: (Seeds.Dummy.error, nil)]
        
        let sut = PokedexWorker(session: Seeds.makeSessionMock())
        
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

fileprivate struct Seeds {
    struct Dummy {
        static let error: PokedexWorkerError = .unavailable
        static let url = URL(string: "https://")
    }
    
    struct Mock {
        static let expectedModel = Pokedex(count: 0, next: "", previous: "", results: [])
        static let data = try! JSONEncoder().encode(expectedModel)
    }
    
    static func makeSessionMock() -> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.protocolClasses = [URLProtocolMock.self]
        return URLSession(configuration: sessionConfig)
    }
}
