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
        let stack = UIStackView(
            frame: CGRect(
                x: .zero,
                y: .zero,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height)
        )
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.addShadow(backgroundColor: .white, shadowColor: .gray, shadowOffset: .zero)
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(
            with: URL(string:viewModel?.pokemon?.sprites.other?.officialArtwork.frontDefault ?? "")
        )
        return imageView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var headerVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    private lazy var titleHStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .top
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pageTitle
        label.textColor = .gray
        label.text = viewModel?.pokemon?.name
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.itemTitle
        label.textColor = .gray
        label.text = "#\(viewModel?.pokemon?.id ?? 00)"
        return label
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whisperColor
        return view
    }()
    
    private lazy var tagsHStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .red
        stack.alignment = .top
        stack.spacing = 8
        return stack
    }()
    
    private lazy var tagsCollection: [TagLabel] = {
        let tags: [TagLabel] = []
        return makeTagCollection() ?? tags
    }()
    
    private func makeTagCollection() -> [TagLabel]? {
        guard let viewModel = viewModel, let pokemon = viewModel.pokemon else { return nil }
        var tags: [TagLabel] = []
        for type in pokemon.types {
            tags.append(TagLabel(title: type.type.name))
        }
        return tags
    }
}

//  MARK: - ViewCode
extension PokemonDetailsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(headerView)
        headerView.addSubview(headerVStackView)
        headerVStackView.addArrangedSubview(titleHStackView)
        titleHStackView.addArrangedSubview(nameLabel)
        titleHStackView.addArrangedSubview(idLabel)
        headerVStackView.addArrangedSubview(tagsHStackView)
        
        for tag in tagsCollection {
            tagsHStackView.addArrangedSubview(tag)
        }
        
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
        headerVStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(48)
        }
        titleHStackView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        pokemonImageView.snp.makeConstraints { make in
            make.width.height.equalTo(240)
            make.centerX.equalTo(frame.width / 2)
            make.centerY.equalTo(frame.height / 2.5)
        }
    }

    func additionalConfigurations() {
        backgroundColor = .white
        pokemonImageView.layer.cornerRadius = 120
    }
}
