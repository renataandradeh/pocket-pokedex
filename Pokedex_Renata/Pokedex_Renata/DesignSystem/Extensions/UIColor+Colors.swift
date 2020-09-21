//
//  UIColor+Colors.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 15/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

extension UIColor {
    static let whisperColor = UIColor(hex: "#E8E8E8ff")!
    static let poisonPurple = UIColor(hex: "#660675ff")!
    static let bugGreen = UIColor(hex: "#98A82Fff")!
    static let flyingBlue = UIColor(hex: "#76BDFEff")!
    static let groundYellow = UIColor(hex: "#BC9746ff")!
    static let electricYellow = UIColor(hex: "#FDC12Bff")!
    static let fireOrange = UIColor(hex: "#EA7538ff")!
    static let fairyPink = UIColor(hex: "#AF76B3ff")!
    static let waterBlue = UIColor(hex: "#006EF6ff")!
    static let grassGreen = UIColor(hex: "#4E7E42ff")!
    static let normalRose = UIColor(hex: "#F1BCBDFF")!
    static let psychicPurple = UIColor(hex: "#9D66E8ff")!
    static let fightingRed = UIColor(hex: "#A81008ff")!
    static let ghostPurple = UIColor(hex: "#E8D3FFff")!
}

//  MARK: - Hex
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

//  MARK: - Adjust Color
extension UIColor {
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
