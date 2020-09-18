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
        view.addShadow()
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 24
        return stack
    }()
    
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.whisperColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
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
            make.top.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(24)
        }
        pokemonImageView.snp.makeConstraints { make in
            make.width.height.equalTo(88)
        }
    }
    
    func additionalConfigurations() {
        selectionStyle = .none
        pokemonImageView.layer.cornerRadius = 44
    }
}
