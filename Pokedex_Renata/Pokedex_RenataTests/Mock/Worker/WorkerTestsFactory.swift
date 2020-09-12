//
//  WorkerTestsFactory.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

struct WorkerTestsFactory {
    static func makeSessionMock() -> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.protocolClasses = [URLProtocolMock.self]
        return URLSession(configuration: sessionConfig)
    }
}
