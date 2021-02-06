//
//  PokemonInfoView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit

class PokemonInfoView: UIView {
    private var viewModel: PokemonInfoModels.DisplayPokemonInfo.ViewModel?
    
    init(viewModel: PokemonInfoModels.DisplayPokemonInfo.ViewModel? = nil) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 8, 8, 8, 8)
        label.font = UIFont.pageTitleBold
        label.textColor = .gray
        label.text = viewModel?.pageTitle
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(PokemonInfoCell.self, forCellReuseIdentifier: "PokemonInfoCell")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func update(viewModel: PokemonInfoModels.DisplayPokemonInfo.ViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = viewModel.pageTitle
            self?.tableView.reloadData()
        }
    }
}

extension PokemonInfoView: ViewCode {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(8)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(8)
            make.left.bottom.right.equalToSuperview().inset(8)
        }
    }
    
    func additionalConfigurations() {
        backgroundColor = .white
    }
}

//  MARK: - UITableViewDataSource
extension PokemonInfoView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.infoList.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonInfoCell", for: indexPath) as! PokemonInfoCell
        guard let viewModel = viewModel else { return cell }
        cell.nameLabel.text = viewModel.infoList[indexPath.row].title
        
        if let value = viewModel.infoList[indexPath.row].value {
            cell.valueLabel.text = "\(value)"
        }
        
        return cell
    }
}


