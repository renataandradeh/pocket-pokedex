//
//  PokemonDetailsView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 16/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class PokemonDetailsView: UIView {
    private var viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel?
    
    init(viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel?) {
        super.init(frame: UIScreen.main.bounds)
        self.viewModel = viewModel
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.addShadow(
            backgroundColor: .white,
            shadowColor: .gray,
            shadowOffset: .zero
        )
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(
            with: URL(string:viewModel?.pokemon?.sprites.other?.officialArtwork.frontDefault ?? "")
        )
        return imageView
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Pokedex.whisperColor
        return view
    }()
}

//  MARK: - ViewCode
extension PokemonDetailsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(headerView)
        contentStackView.addArrangedSubview(footerView)
        addSubview(pokemonImageView)
    }
    
    func setupConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        headerView.snp.makeConstraints { make in
            make.height.equalTo(frame.height / 2.5)
        }
        pokemonImageView.snp.makeConstraints { make in
            make.width.height.equalTo(250)
            make.centerX.equalTo(frame.width / 2)
            make.centerY.equalTo(frame.height / 2.5)
        }
    }

    func additionalConfigurations() {
        backgroundColor = .white
        pokemonImageView.layer.cornerRadius = 125
    }
}
