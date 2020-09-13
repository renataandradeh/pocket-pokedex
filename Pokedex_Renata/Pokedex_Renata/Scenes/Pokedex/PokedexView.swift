//
//  PokedexView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit

class PokedexView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var pokemonList: [String] = []
    
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
        pokemonList = viewModel.pokemonNames
        tableView.reloadData()
    }
}

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
        backgroundColor = .white
    }
}

extension PokedexView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexTableViewCell") as! PokedexTableViewCell
        cell.nameLabel.text = pokemonList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
