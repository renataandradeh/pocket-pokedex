//
//  PokedexPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokedexPresentationLogic {
    func presentPokemonReferenceList(response: PokedexModels.FetchPokemonReferenceList.Response)
}

class PokedexPresenter {
    private weak var viewController: PokedexDisplayLogic?
    
    init(viewController: PokedexDisplayLogic) {
        self.viewController = viewController
    }
}

extension PokedexPresenter: PokedexPresentationLogic {
    func presentPokemonReferenceList(response: PokedexModels.FetchPokemonReferenceList.Response) {
        viewController?.displayPokemonReferenceList(
            viewModel: PokedexModels.FetchPokemonReferenceList.ViewModel(
                pokemonReferences: response.referenceList
            )
        )
    }
}
