//
//  PokedexTaBarController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

class PokedexTaBarController: UITabBarController {
    override func viewDidLoad() {
        setViewControllers(PokedexTabBarFactory.makeTabControllers(), animated: true)
    }
}
