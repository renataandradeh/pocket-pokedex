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

protocol PokemonDetailsViewDelegate: AnyObject {
    func didTapStats()
    func didTapAbilities()
    func didTapGames()
    func didTapAddToFavorites()
    func didCreateTabBar(item: UIBarButtonItem)
}

class PokemonDetailsView: UIView {
    private var viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel?
    private weak var delegate: PokemonDetailsViewDelegate?
    
    init(
        delegate: PokemonDetailsViewDelegate,
        viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel?
    ) {
        super.init(frame: UIScreen.main.bounds)
        self.viewModel = viewModel
        self.delegate = delegate
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        footerView.applyGradient(colors: getColors(for: tagsCollection))
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
        imageView.addShadow(
            backgroundColor: .white,
            shadowColor: .whisperColor,
            shadowOffset: CGSize(width: 0, height: -1)
        )
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
        stack.alignment = .center
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
        label.font = UIFont.itemTitleBold
        label.textColor = .gray
        label.text = "#\(viewModel?.pokemon?.id ?? 00)"
        return label
    }()
    
    private lazy var tagsHStackView: UIStackView = {
        let stack = UIStackView()
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
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.applyGradient(colors: [.whisperColor, .white])
        return view
    }()
    
    private lazy var footerVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fillProportionally
        stack.spacing = 32
        return stack
    }()
    
    private lazy var heightWeightView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var heightValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pageSubTitleBold
        label.textColor = .gray
        label.text = "\(viewModel?.pokemon?.height ?? 0) m"
        label.sizeToFit()
        return label
    }()
    
    private lazy var weightValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pageSubTitleBold
        label.textColor = .gray
        label.text = "\(viewModel?.pokemon?.weight ?? 0) kg"
        label.sizeToFit()
        return label
    }()
    
    private lazy var heightTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.itemTitle
        label.textColor = .gray
        label.text = "height"
        return label
    }()
    
    private lazy var weightTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.itemTitle
        label.textColor = .gray
        label.text = "weight"
        return label
    }()
    
    private lazy var footerCircleLabelsHStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private lazy var abilitiesLabel: PaddingLabel = {
        let label = makeCirclePaddingLabel(withTitle: "abilities")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(abilitiesTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    @objc func abilitiesTapped() {
        delegate?.didTapAbilities()
    }
    
    private lazy var statsLabel: PaddingLabel = {
        let label = makeCirclePaddingLabel(withTitle: "stats")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(statsTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()

    @objc func statsTapped() {
        delegate?.didTapStats()
    }
    
    private lazy var gamesLabel: PaddingLabel = {
        let label = makeCirclePaddingLabel(withTitle: "games")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gamesTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()

    @objc func gamesTapped() {
        delegate?.didTapGames()
    }
    
    private func makeCirclePaddingLabel(withTitle title: String) -> PaddingLabel {
        let label = PaddingLabel(withInsets: 16, 16, 8, 8)
        label.addShadow(
            backgroundColor: .white,
            cornerRadius: 10,
            shadowColor: .black,
            shadowOffset: CGSize(width: 0, height: 1.0)
        )
        label.layer.masksToBounds = true
        label.font = UIFont.itemTitleBold
        label.textColor = .gray
        label.text = title
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        return label
    }
    
    private func makeAddToFavoritesBarButtonItem() {
        let item = UIBarButtonItem(
            title: "like",
            style: .plain,
            target: self,
            action: #selector(addTofavoritesTapped)
        )
        delegate?.didCreateTabBar(item: item)
    }
    
    @objc func addTofavoritesTapped() {
        delegate?.didTapAddToFavorites()
    }
    
    private func getColors(for tags: [TagLabel]) -> [UIColor] {
        var colors: [UIColor] = []
        for tag in tags {
            colors.append(tag.backgroundColor ?? .white)
        }
        return colors
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
        
        footerView.addSubview(footerVStackView)
        footerVStackView.addArrangedSubview(heightWeightView)
        heightWeightView.addSubview(heightValueLabel)
        heightWeightView.addSubview(weightValueLabel)
        heightWeightView.addSubview(heightTitleLabel)
        heightWeightView.addSubview(weightTitleLabel)
        footerVStackView.addArrangedSubview(footerCircleLabelsHStackView)
        footerCircleLabelsHStackView.addArrangedSubview(abilitiesLabel)
        footerCircleLabelsHStackView.addArrangedSubview(statsLabel)
        footerCircleLabelsHStackView.addArrangedSubview(gamesLabel)
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
            make.top.equalToSuperview().inset(8)
        }
        titleHStackView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        pokemonImageView.snp.makeConstraints { make in
            make.width.height.equalTo(frame.height / 3)
            make.centerX.equalTo(frame.width / 2)
            make.centerY.equalTo(frame.height / 3)
        }
        footerVStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.center.equalToSuperview()
        }
        heightWeightView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalTo(pokemonImageView.snp.centerX)
        }
        heightValueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(32)
        }
        weightValueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(32)
        }
        heightTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(heightValueLabel.snp.centerX)
            make.top.equalTo(heightValueLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(16)
        }
        weightTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(weightValueLabel.snp.centerX)
            make.centerY.equalTo(heightTitleLabel)
            make.bottom.equalToSuperview().inset(16)
        }
        footerCircleLabelsHStackView.snp.makeConstraints { make in
            make.left.right.equalTo(heightWeightView)
        }
    }

    func additionalConfigurations() {
        backgroundColor = .white
        pokemonImageView.layer.cornerRadius = frame.height / 6
        makeAddToFavoritesBarButtonItem()
    }
}
