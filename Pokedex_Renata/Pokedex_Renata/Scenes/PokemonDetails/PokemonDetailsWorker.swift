//
//  PokemonDetailsWorker.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

enum PokemonDetailsWorkerResult {
    case success
    case failure(PokedexWorkerError)
}

protocol PokemonDetailsWorkLogic {
    func isFavorite(pokemon: Pokemon?) -> Bool
    func favoritePokemon(completion: @escaping (PokemonDetailsWorkerResult) -> Void)
    func addToFavorites(pokemon: Pokemon?) -> Bool
}

//  MARK: - Networking
class PokemonDetailsWorker: Networking {
    var session: URLSession
    var userDefaults: UserDefaults

    init(session: URLSession = URLSession.shared, userDefaults: UserDefaults = UserDefaults.standard) {
        self.session = session
        self.userDefaults = userDefaults
    }
    
    func makeRequest(withURL url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.type
        return request
    }
}
//  MARK: - PokemonDetailsWorkLogic
extension PokemonDetailsWorker: PokemonDetailsWorkLogic {
    func isFavorite(pokemon: Pokemon?) -> Bool {
        guard let pokemon = pokemon else { return false }
        let key = "\(pokemon.id)"
        return userDefaults.bool(forKey: key)
    }
    
    func favoritePokemon(completion: @escaping (PokemonDetailsWorkerResult) -> Void) {
        let url = URLBuilder.make(withEndpoint: .favoritePokemon)
        session.dataTask(with: makeRequest(withURL: url, method: .post)) { (data, response, error) in
            guard let _ = data, error == nil else {
                if let _ = error {
                    completion(.failure(.unavailable))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success)
            }
            
        }.resume()
    }
    
    func addToFavorites(pokemon: Pokemon?) -> Bool {
        guard let pokemon = pokemon else { return false }
        let key = "\(pokemon.id)"
        if isFavorite(pokemon: pokemon) {
            userDefaults.removeObject(forKey: key)
            return false
        } else {
            userDefaults.set(true, forKey: key)
            return true
        }
    }
}
