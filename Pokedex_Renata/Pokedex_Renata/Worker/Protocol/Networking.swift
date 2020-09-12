//
//  Networking.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol Networking {
    var session: URLSession { get set }
    func makeRequest(withURL url: URL, method: HTTPMethod) -> URLRequest
}
