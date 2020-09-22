//
//  PokemonDetailsPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

protocol PokemonDetailsPresentationLogic {
    func presentPokemonDetails(response: PokemonDetailsModels.DisplayPokemonDetails.Response)
    func presentAddedToFavorites(response: PokemonDetailsModels.DisplayAddedToFavorites.Response)
}

class PokemonDetailsPresenter {
    private weak var viewController: PokemonDetailsDisplayLogic?
    
    init(viewController: PokemonDetailsDisplayLogic) {
        self.viewController = viewController
    }
}

//  MARK: - PokemonDetailsPresentationLogic
extension PokemonDetailsPresenter: PokemonDetailsPresentationLogic {
    func presentPokemonDetails(response: PokemonDetailsModels.DisplayPokemonDetails.Response) {
        guard let currentPokemon = response.currentPokemon else { return }
        viewController?.displayPokemonDetails(viewModel:
            .init(
                id: "\(currentPokemon.id)",
                name: currentPokemon.name,
                height: "\(currentPokemon.height)",
                weight: "\(currentPokemon.weight)",
                imageUrl: currentPokemon.sprites.other?.officialArtwork.frontDefault ?? "",
                tags: makeTags(for: currentPokemon.types)
            )
        )
    }
    
    func presentAddedToFavorites(response: PokemonDetailsModels.DisplayAddedToFavorites.Response) {
        let title = response.wasAdded ? "Success" : "Warning"
        let message = response.wasAdded ? "Pokemon added to the favorites!" : "You already liked this Pokemon!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController?.displayAddedToFavorites(viewModel: .init(alert: alert))
    }
}

//  MARK: - Factory
extension PokemonDetailsPresenter {
    private func makeTags(for types: [TypeElement]) -> [TagLabel] {
        var tags: [TagLabel] = []
        for element in types {
            tags.append(TagLabel(title: element.type.name))
        }
        return tags
    }
}
