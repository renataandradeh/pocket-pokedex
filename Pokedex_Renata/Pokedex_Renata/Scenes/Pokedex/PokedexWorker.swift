//
//  PokedexWorker.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

enum PokedexWorkerError: Error {
    case unavailable
}

enum PokedexWorkerResult {
    case success(Pokedex?)
    case failure(PokedexWorkerError)
}

protocol PokedexAPIClient {
    func fetchPokedex(completion: @escaping (PokedexWorkerResult) -> Void)
}

//  MARK: - Networking
class PokedexWorker: Networking {
    var session: URLSession
    
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=10&offset=10")!
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func makeRequest(withURL url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        return request
    }
}

//  MARK: - PokedexAPIClient
extension PokedexWorker: PokedexAPIClient {
    func fetchPokedex(completion: @escaping (PokedexWorkerResult) -> Void) {
        session.dataTask(with: makeRequest(withURL: url, method: .get)) { (data, response, error) in
            guard let data = data, error == nil else {
                if let _ = error {
                    completion(.failure(.unavailable))
                }
                return
            }
            
            let response = try? JSONDecoder().decode(Pokedex.self, from: data)
            DispatchQueue.main.async {
                completion(.success(response))
            }
            
        }.resume()
    }
}
