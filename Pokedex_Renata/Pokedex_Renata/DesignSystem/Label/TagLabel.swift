//
//  TagLabel.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 17/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

class TagLabel: PaddingLabel {
    init(title: String) {
        super.init(withInsets: 4, 4, 12, 12)
        text = title
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable)
    required init(withInsets top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        fatalError("init(withInsets:_:_:_:) has not been implemented")
    }
    
    private func setupView() {
        font = UIFont.itemTitle
        textColor = .white
        layer.cornerRadius = 14
        layer.masksToBounds = true
        textAlignment = .center
        backgroundColor = getTagColor()
    }
    
    private func getTagColor() -> UIColor {
        switch text {
        case "bug":
            return .bugGreen
        case "poison":
            return .poisonPurple
        case "flying":
            return .flyingBlue
        case "ground":
            return .groundYellow
        case "electric":
            return .electricYellow
        case "fire":
            return .fireOrange
        case "fairy":
            return .fairyPink
        case "water":
            return .waterBlue
        case "grass":
            return .grassGreen
        case "normal":
            return .normalYellow
        case "psychic":
            return .psychicPurple
        case "fighting":
            return .fightingRed
        case "ghost":
            return .ghostPurple
        case "ice":
            return .iceBlue
        case "dark":
            return .darkBrown
        case "dragon":
            return .dragonPurple
        case "steel":
            return .steelSilver
        default:
            return .gray
        }
    }
}
