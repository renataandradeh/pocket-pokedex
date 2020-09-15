//
//  PokedexTableViewCell.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit

class PokedexTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    private lazy var roundedView: UIView = {
        let view = UIView(frame: CGRect(x: .zero, y: .zero, width: 100, height: 100))
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalCentering
        return stack
    }()
    
    lazy var pokemonImageView: UIImageView = {
        return UIImageView(frame: CGRect(x: .zero, y: .zero, width: 40, height: 40))
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "test"
        return label
    }()
}

extension PokedexTableViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(roundedView)
        roundedView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(pokemonImageView)
        contentStackView.addArrangedSubview(nameLabel)
    }
    
    func setupConstraints() {
        roundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}
