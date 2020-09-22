//
//  PokemonGamesView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit

class PokemonGamesView: UIView {
    private var viewModel: PokemonGamesModels.DisplayGamesVersionsNames.ViewModel?
    
    init(viewModel: PokemonGamesModels.DisplayGamesVersionsNames.ViewModel? = nil) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 16, 16, 8, 8)
        label.font = UIFont.pageTitleBold
        label.textColor = .gray
        label.text = "games"
        return label
    }()
    
    private lazy var tableView: PokemonInfoTableView = {
        let tableView = PokemonInfoTableView()
        tableView.dataSource = self
        return tableView
    }()
    
    func update(viewModel: PokemonGamesModels.DisplayGamesVersionsNames.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension PokemonGamesView: ViewCode {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    func additionalConfigurations() {
        backgroundColor = .white
    }
}

//  MARK: - UITableViewDataSource
extension PokemonGamesView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.gameVersionsNames.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.tableView.cellReuseIdentifier, for: indexPath) as! PokemonInfoCell
        guard let viewModel = viewModel else { return cell }
        cell.nameLabel.text = viewModel.gameVersionsNames[indexPath.row]
        return cell
    }
}


