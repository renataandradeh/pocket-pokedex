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
            return UIColor.bugGreen
        case "poison":
            return UIColor.poisonPurple
        case "flying":
            return UIColor.flyingBlue
        case "ground":
            return UIColor.groundYellow
        case "electric":
            return UIColor.electricYellow
        case "fire":
            return UIColor.fireOrange
        case "fairy":
            return UIColor.fairyPink
        case "water":
            return UIColor.waterBlue
        case "grass":
            return UIColor.grassGreen
        case "normal":
            return UIColor.normalRose
        case "psychic":
            return UIColor.psychicPurple
        case "fighting":
            return UIColor.fightingRed
        case "ghost":
            return UIColor.ghostPurple
        default:
            return .gray
        }
    }
}
