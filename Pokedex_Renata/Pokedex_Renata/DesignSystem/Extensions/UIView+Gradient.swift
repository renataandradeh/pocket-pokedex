//
//  UIView+Gradient.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 21/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradient(colors: [UIColor]) {
        var gradientColors: [CGColor] = []
        for color in colors {
            gradientColors.append(color.cgColor)
        }
        if gradientColors.count < 2 { gradientColors.append(UIColor.white.cgColor) }
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = gradientColors
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.5)
        layer.insertSublayer(gradient, at: 0)
    }
}
