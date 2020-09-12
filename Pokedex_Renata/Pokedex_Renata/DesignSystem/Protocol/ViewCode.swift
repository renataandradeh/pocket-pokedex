//
//  ViewCode.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

protocol ViewCode {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func additionalConfigurations()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        additionalConfigurations()
    }
    
    func additionalConfigurations() {}
}
