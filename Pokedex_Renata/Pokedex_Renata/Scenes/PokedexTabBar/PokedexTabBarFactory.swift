//
//  PokedexTabBarFactory.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 12/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

struct PokedexTabBarFactory {
    static func makeTabControllers() -> [UIViewController] {
        let controllers: [UIViewController] = [
            PokedexTabBarFactory.makePokedexController()
        ]
        return controllers
    }
    
    private static func makePokedexController() -> UIViewController {
        let controller = PokedexFactory.makeController()
        let item = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        controller.tabBarItem = item
        return controller
    }
}
