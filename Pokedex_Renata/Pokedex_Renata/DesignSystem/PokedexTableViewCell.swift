//
//  PokedexTableViewCell.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    private lazy var roundedView: UIView = {
        let view = UIView(frame: CGRect(x: .zero, y: .zero, width: 100, height: 100))
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        return view
    }()
}

extension PokedexTableViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(roundedView)
    }
    
    func setupConstraints() {
    }
}
