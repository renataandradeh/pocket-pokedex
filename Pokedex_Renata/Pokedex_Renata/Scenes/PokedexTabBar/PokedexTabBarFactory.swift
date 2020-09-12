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
            PokedexTabBarFactory.makeHomeController()
        ]
        return controllers
    }
    
    private static func makeHomeController() -> UIViewController {
        let controller = ViewController()
        let item = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        controller.tabBarItem = item
        return controller
    }
}
