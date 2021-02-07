//
//  UIViewController+Loading.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 06/02/21.
//  Copyright © 2021 Renata Gondim Andrade. All rights reserved.
//

import UIKit

extension UIViewController {
    private static var loading: LoadingView?
    
    func startLoading() {
        UIViewController.loading = LoadingView(frame: view.bounds)
        
        guard let loading = UIViewController.loading else { return }
        loading.play()
        view.addSubview(loading)
    }
    
    func stopLoading() {
        guard let loading = UIViewController.loading else { return }
        loading.removeFromSuperview()
        loading.stop()
    }
}
