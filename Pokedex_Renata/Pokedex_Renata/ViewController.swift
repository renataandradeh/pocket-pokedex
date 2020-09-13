//
//  ViewController.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        view = PokedexView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let worker = PokedexWorker(session: URLSession.shared)
        worker.fetchPokedex(url:
            URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=10&offset=10")!, completion: { result in
                print(result)
        })
    }
}
