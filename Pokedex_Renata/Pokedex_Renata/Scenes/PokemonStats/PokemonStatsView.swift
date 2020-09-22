//
//  PokemonStatsView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit

class PokemonStatsView: UIView {
    private var viewModel: PokemonStatsModels.DisplayStats.ViewModel?
    
    init(viewModel: PokemonStatsModels.DisplayStats.ViewModel? = nil) {
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
        label.text = "base stats"
        return label
    }()
    
    private lazy var tableView: PokemonInfoTableView = {
        let tableView = PokemonInfoTableView()
        tableView.dataSource = self
        return tableView
    }()
    
    func update(viewModel: PokemonStatsModels.DisplayStats.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension PokemonStatsView: ViewCode {
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
extension PokemonStatsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.baseStats.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.tableView.cellReuseIdentifier, for: indexPath) as! PokemonInfoCell
        guard let viewModel = viewModel else { return cell }
        cell.nameLabel.text = viewModel.baseStats[indexPath.row].name
        cell.valueLabel.text = "\(viewModel.baseStats[indexPath.row].baseStat)"
        return cell
    }
}
