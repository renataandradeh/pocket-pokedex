//
//  PokemonAbilitiesPresenter.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokemonAbilitiesPresentationLogic {
    func presentPokemonAbilities(response: PokemonAbilitiesModels.DisplayAbilities.Response)
}

class PokemonAbilitiesPresenter {
    private weak var viewController: PokemonAbilitiesDisplayLogic?
    
    init(viewController: PokemonAbilitiesDisplayLogic) {
        self.viewController = viewController
    }
}

//  MARK: - PokemonAbilitiesPresentationLogic
extension PokemonAbilitiesPresenter: PokemonAbilitiesPresentationLogic {
    func presentPokemonAbilities(response: PokemonAbilitiesModels.DisplayAbilities.Response) {
        var abilities: [SingleAbility] = []
        guard let pokemon = response.pokemon else { return }
        for ability in pokemon.abilities {
            abilities.append(SingleAbility(name: ability.ability.name, slot: ability.slot))
        }
        viewController?.displayPokemonAbilities(viewModel: .init(abilities: abilities))
    }
}
