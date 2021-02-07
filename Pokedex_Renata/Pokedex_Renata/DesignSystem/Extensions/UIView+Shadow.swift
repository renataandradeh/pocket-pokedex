//
//  UIViewExtensions.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 15/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(
        backgroundColor: UIColor = .black,
        cornerRadius: CGFloat = 5,
        shadowOpacity: Float = 1,
        shadowRadius: CGFloat = 2,
        shadowColor: UIColor = .darkGray,
        shadowOffset: CGSize = CGSize(width: 0, height: 1)
    ) {
        self.backgroundColor = backgroundColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
    }
}
