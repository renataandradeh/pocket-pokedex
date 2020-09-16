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
    case invalidURL
}

enum PokedexWorkerResult {
    case success(Pokedex?)
    case failure(PokedexWorkerError)
}

enum PokemonWorkerResult {
    case success(Pokemon?)
    case failure(PokedexWorkerError)
}

enum PokemonListWorkerResult {
    case success(nextPage: String?, pokemonList: [Pokemon]?)
    case failure(PokedexWorkerError)
}


protocol PokedexAPIClient {
    func fetchPokedex(nextPageURL: URL?, completion: @escaping (PokedexWorkerResult) -> Void)
    func fetchPokemon(url: URL?, completion: @escaping (PokemonWorkerResult) -> Void)
    func fetchPokemonList(nextPageURL: URL?, completion: @escaping (PokemonListWorkerResult) -> Void)
}

//  MARK: - Networking
class PokedexWorker: Networking {
    var session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func makeRequest(withURL url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.type
        return request
    }
}

//  MARK: - PokedexAPIClient
extension PokedexWorker: PokedexAPIClient {
    func fetchPokedex(nextPageURL: URL?, completion: @escaping (PokedexWorkerResult) -> Void) {
        let url = nextPageURL ?? URLBuilder.make(withEndpoint: .fetchPokemonReferenceList)
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
    
    func fetchPokemon(url: URL?, completion: @escaping (PokemonWorkerResult) -> Void) {
        guard let url = url else { return completion(.failure(.invalidURL)) }
        session.dataTask(with: makeRequest(withURL: url, method: .get)) { (data, response, error) in
            guard let data = data, error == nil else {
                if let _ = error {
                    completion(.failure(.unavailable))
                }
                return
            }
            
            let response = try? JSONDecoder().decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                completion(.success(response))
            }
            
        }.resume()
    }
    
    func fetchPokemonList(nextPageURL: URL?, completion: @escaping (PokemonListWorkerResult) -> Void) {
        fetchPokedex(nextPageURL: nextPageURL) { [weak self] result in
            var pokemonList: [Pokemon] = []
            guard let self = self else { return }
            switch result {
            case .failure:
                completion(.failure(.unavailable))
            case .success(let list):
                guard let list = list else { return }
                let group = DispatchGroup()
                for reference in list.results {
                    guard let url = URL(string: reference.url) else { return completion(.failure(.invalidURL)) }
                    group.enter()
                    self.fetchPokemon(url: url) { result in
                        switch result {
                        case .failure:
                            completion(.failure(.unavailable))
                        case .success(let pokemon):
                            guard let pokemon = pokemon else { return }
                            pokemonList.append(pokemon)
                        }
                        group.leave()
                    }
                }
                group.notify(queue: .main) {
                    completion(.success(nextPage: list.next, pokemonList: pokemonList))
                }
            }
        }
    }
}
