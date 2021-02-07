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
        guard let lastColor = colors.last else { return }

        var gradientColors: [CGColor] = []
        gradientColors.append(lastColor.cgColor)
        gradientColors.append(UIColor.black.cgColor)
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = gradientColors
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.5)
        layer.insertSublayer(gradient, at: 0)
    }
}
