//
//  PokemonStatTableViewCell.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 20/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit

class PokemonStatTableViewCell: UITableViewCell {
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

    lazy var nameLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 8, 8, 8, 8)
        label.font = UIFont.itemTitle
        label.textColor = .gray
        return label
    }()
    
    lazy var baseStatLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 8, 8, 8, 8)
        label.font = UIFont.itemTitleBold
        label.textColor = .gray
        return label
    }()
}

extension PokemonStatTableViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(baseStatLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.bottom.left.top.equalToSuperview().offset(8)
        }
        baseStatLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    func additionalConfigurations() {
        selectionStyle = .none
    }
}
