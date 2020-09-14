//
//  PokedexInteractor.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 13/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol PokedexBusinessLogic {
    func fetchPokemonReferenceList(request: PokedexModels.FetchPokemonReferenceList.Request)
}

protocol PokedexDataStore {
    var nextPage: URL? { get set }
}

class PokedexInteractor: PokedexDataStore {
    private var presenter: PokedexPresentationLogic?
    private var worker: PokedexAPIClient?
    
    var previousPage: URL?
    var nextPage: URL?
    
    init(presenter: PokedexPresentationLogic, worker: PokedexAPIClient) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension PokedexInteractor: PokedexBusinessLogic {
    func fetchPokemonReferenceList(request: PokedexModels.FetchPokemonReferenceList.Request) {
        worker?.fetchPokedex(nextPageURL: nextPage, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let list):
                self.nextPage = URL(string: list?.next ?? "")
                self.presenter?.presentPokemonReferenceList(
                    response: PokedexModels.FetchPokemonReferenceList.Response(referenceList: list?.results ?? [])
                )
            }
        })
    }
}
