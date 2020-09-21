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
    func didSelectPokemonAt(indexPath: IndexPath)
}

class PokedexView: UIView {
    private weak var delegate: PokedexViewDelegate?
    private var pokemons: [PokemonItem] = []
    
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func updateView(withViewModel viewModel: PokedexModels.FetchPokemonList.ViewModel) {
        pokemons.append(contentsOf: viewModel.pokemons)
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
}

//  MARK: - UITableViewDataSource
extension PokedexView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexTableViewCell") as! PokedexTableViewCell
        let pokemon = pokemons[indexPath.row]
        cell.nameLabel.text = pokemon.name
        cell.pokemonImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.pokemonImageView.sd_setImage(with: pokemon.url)
        cell.roundedView.backgroundColor = pokemon.itemColor
        cell.pokemonImageView.backgroundColor = pokemon.itemColor.lighter(by: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//  MARK: - UITableViewDelegate
extension PokedexView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectPokemonAt(indexPath: indexPath)
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
