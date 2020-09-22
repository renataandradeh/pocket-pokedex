//
//  PokemonDetailsModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 16/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

enum PokemonDetailsModels {
    enum DisplayPokemonDetails {
        struct Request {
        }
        
        struct Response: Model {
            let currentPokemon: Pokemon?
        }
        
        struct ViewModel {
            let id: String
            let name: String
            let height: String
            let weight: String
            let imageUrl: String
            let tags: [TagLabel]
            let gradientColors: [UIColor]
        }
    }
    
    enum DisplayAddedToFavorites {
        struct Request {
        }
        
        struct Response: Model {
            let wasAdded: Bool
        }
        
        struct ViewModel {
            let alert: UIAlertController
        }
    }
}
