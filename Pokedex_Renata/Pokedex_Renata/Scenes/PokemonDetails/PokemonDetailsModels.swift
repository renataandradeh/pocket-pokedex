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
        }
        
        struct ViewModel {
            let pokemon: Pokemon?
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
