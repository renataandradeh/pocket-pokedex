//
//  AppDelegate.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        let controller = PokedexTaBarController()
        let navigationController = configureNavigation(withController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    private func configureNavigation(withController controller: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = .gray
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
}

