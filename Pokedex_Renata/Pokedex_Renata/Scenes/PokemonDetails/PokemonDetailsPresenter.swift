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
    func presentAddingToFavoritesError()
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
        let tags = makeTags(for: currentPokemon.types)
        viewController?.displayPokemonDetails(viewModel:
            .init(
                id: "\(currentPokemon.id)",
                name: currentPokemon.name,
                isFavorite: response.isFavorite,
                height: "\((Float(currentPokemon.height) / 10.0).clean)",
                weight: "\((Float(currentPokemon.weight) / 10.0).clean)",
                imageUrl: currentPokemon.sprites?.other?.officialArtwork.frontDefault ?? "",
                tags: tags,
                gradientColors: getColors(for: tags)
            )
        )
    }

    
    
    func presentAddedToFavorites(response: PokemonDetailsModels.DisplayAddedToFavorites.Response) {
        guard let wasAdded = response.wasAdded else { return }
        viewController?.displayAddedToFavorites(viewModel: .init(isFavorite: wasAdded, errorAlert: nil))
    }
    
    func presentAddingToFavoritesError() {
        let title = "Warning"
        let message = "Can't add to favorites :( \nPlease try again later"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController?.displayAddingToFavoritesError(viewModel: .init(isFavorite: nil, errorAlert: alert))
    }
}

//  MARK: - Helpers
extension PokemonDetailsPresenter {
    private func makeTags(for types: [TypeElement]) -> [TagLabel] {
        var tags: [TagLabel] = []
        for element in types {
            tags.append(TagLabel(title: element.type.name))
        }
        return tags
    }
    
    private func getColors(for tags: [TagLabel]) -> [UIColor] {
        var colors: [UIColor] = []
        for tag in tags {
            colors.append(tag.backgroundColor ?? .white)
        }
        return colors
    }
}


