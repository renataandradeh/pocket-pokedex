//
//  PokedexView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

protocol PokedexViewDelegate: AnyObject {
    func didScrollToTheEnd()
    func didSelectPokemonAt(indexPath: IndexPath, withQuery query: String?)
    func didCreate(item: UIBarButtonItem)
}

class PokedexView: UIView {
    private weak var delegate: PokedexViewDelegate?
    
    private var pokemons: [PokemonCell] = []
    private var filteredPokemons: [PokemonCell] = []
    private var isSearching: Bool = false
    
    init(delegate: PokedexViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokedexTableViewCell.self, forCellReuseIdentifier: "PokedexTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Search by Pokémon's name"
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.sizeToFit()
        return searchBar
    }()
    
    func update(viewModel: PokedexModels.FetchPokemonList.ViewModel) {
        pokemons.append(contentsOf: viewModel.pokemonCells)
        if !isSearching {
            filteredPokemons.append(contentsOf: pokemons)
        }
        tableView.reloadData()
    }
}

//  MARK: - ViewCode
extension PokedexView: ViewCode {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func additionalConfigurations() {
        let item = UIBarButtonItem(customView: searchBar)
        delegate?.didCreate(item: item)
    }
}

//  MARK: - UITableViewDataSource
extension PokedexView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredPokemons.count : pokemons.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexTableViewCell") as! PokedexTableViewCell
        let pokemon = isSearching ? filteredPokemons[indexPath.row] : pokemons[indexPath.row]
        cell.nameLabel.text = pokemon.name
        cell.pokemonImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.pokemonImageView.sd_setImage(with: URL(string: pokemon.imageURL))
        cell.roundedView.backgroundColor = pokemon.cellColor.lighter()
        cell.pokemonImageView.backgroundColor = pokemon.cellColor
        cell.nameLabel.backgroundColor = pokemon.cellColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//  MARK: - UITableViewDelegate
extension PokedexView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectPokemonAt(indexPath: indexPath, withQuery: searchBar.text)
    }
}

//  MARK: - UIScrollViewDelegate
extension PokedexView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom <= (height + height * 0.3) {
            delegate?.didScrollToTheEnd()
        }
    }
}

extension PokedexView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty  else {
            isSearching = false
            filteredPokemons = pokemons
            tableView.reloadData()
            return
        }
        isSearching = true
        filteredPokemons = pokemons.filter({ pokemon -> Bool in
            return pokemon.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
