//
//  PokedexModels.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

enum PokedexModels {
    enum FetchPokemonReferenceList {
        struct Request {
        }
        
        struct Response: Model {
            let referenceList: [Reference]
        }
        
        struct ViewModel {
            let pokemonReferences: [Reference]
        }
    }
}
