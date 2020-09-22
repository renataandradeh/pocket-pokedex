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
    
    //  MARK: - Lifecycle
    init(
        delegate: PokemonDetailsViewDelegate,
        viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel? = nil
    ) {
        super.init(frame: UIScreen.main.bounds)
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let viewModel = viewModel else { return }
        footerView.applyGradient(colors: viewModel.gradientColors)
    }
    
    func update(viewModel: PokemonDetailsModels.DisplayPokemonDetails.ViewModel) {
        self.viewModel = viewModel
        setupView()
    }

    //  MARK: - Views
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
        if let viewModel = viewModel {
            imageView.sd_setImage(with: URL(string: viewModel.imageUrl))
        }
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
        label.font = UIFont.pageTitleBold
        label.textColor = .gray
        label.text = viewModel?.name
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.itemTitleBold
        label.textColor = .gray
        label.text = "#\(viewModel?.id ?? "00")"
        return label
    }()
    
    private lazy var tagsHStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .top
        stack.spacing = 8
        return stack
    }()
    
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
        label.font = UIFont.pageSubtitleBold
        label.textColor = .gray
        label.text = "\(viewModel?.height ?? "0") m"
        label.sizeToFit()
        return label
    }()
    
    private lazy var weightValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pageSubtitleBold
        label.textColor = .gray
        label.text = "\(viewModel?.weight ?? "0") kg"
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
    
    private lazy var footerRoundedLabelsHStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private lazy var abilitiesLabel: PaddingLabel = {
        let label = makeRoundedPaddingLabel(withTitle: "abilities")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(abilitiesTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    @objc func abilitiesTapped() {
        delegate?.didTapAbilities()
    }
    
    private lazy var statsLabel: PaddingLabel = {
        let label = makeRoundedPaddingLabel(withTitle: "stats")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(statsTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()

    @objc func statsTapped() {
        delegate?.didTapStats()
    }
    
    private lazy var gamesLabel: PaddingLabel = {
        let label = makeRoundedPaddingLabel(withTitle: "games")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gamesTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()

    @objc func gamesTapped() {
        delegate?.didTapGames()
    }
    
    private func makeRoundedPaddingLabel(withTitle title: String) -> PaddingLabel {
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
            title: String.Icon.emptyHeart,
            style: .plain,
            target: self,
            action: #selector(addTofavoritesTapped)
        )
        let font = UIFont.pageSubtitle
        item.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        delegate?.didCreateTabBar(item: item)
    }
    
    @objc func addTofavoritesTapped() {
        delegate?.didTapAddToFavorites()
    }
}

//  MARK: - ViewCode
extension PokemonDetailsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(contentStackView)
        
        //  Header
        contentStackView.addArrangedSubview(headerView)
        headerView.addSubview(headerVStackView)
        
        //  Title
        headerVStackView.addArrangedSubview(titleHStackView)
        titleHStackView.addArrangedSubview(nameLabel)
        titleHStackView.addArrangedSubview(idLabel)
        
        //  Tags
        headerVStackView.addArrangedSubview(tagsHStackView)
        if let viewModel = viewModel {
            for tag in viewModel.tags {
                tagsHStackView.addArrangedSubview(tag)
            }
        }
        
        //  Pokemon
        addSubview(pokemonImageView)
        
        //  Footer
        contentStackView.addArrangedSubview(footerView)
        footerView.addSubview(footerVStackView)
        
        //  Pokemon's height and weight
        footerVStackView.addArrangedSubview(heightWeightView)
        heightWeightView.addSubview(heightValueLabel)
        heightWeightView.addSubview(weightValueLabel)
        heightWeightView.addSubview(heightTitleLabel)
        heightWeightView.addSubview(weightTitleLabel)
        
        // Interactable labels
        footerVStackView.addArrangedSubview(footerRoundedLabelsHStackView)
        footerRoundedLabelsHStackView.addArrangedSubview(abilitiesLabel)
        footerRoundedLabelsHStackView.addArrangedSubview(statsLabel)
        footerRoundedLabelsHStackView.addArrangedSubview(gamesLabel)
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
        footerRoundedLabelsHStackView.snp.makeConstraints { make in
            make.left.right.equalTo(heightWeightView)
        }
    }

    func additionalConfigurations() {
        backgroundColor = .white
        pokemonImageView.layer.cornerRadius = frame.height / 6
        makeAddToFavoritesBarButtonItem()
    }
}

