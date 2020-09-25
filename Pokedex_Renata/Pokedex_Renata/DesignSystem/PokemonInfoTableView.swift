//
//  PokemonInfoTableView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

class PokemonInfoTableView: UITableView {
    let cellReuseIdentifier: String = "PokemonInfoCell"
    
    init() {
        super.init(frame: .zero, style: .plain)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        register(PokemonInfoCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        separatorStyle = .none
        tableFooterView = UIView()
        translatesAutoresizingMaskIntoConstraints = false
    }
}
