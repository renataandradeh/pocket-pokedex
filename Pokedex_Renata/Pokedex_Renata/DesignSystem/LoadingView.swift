//
//  LoadingView.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 06/02/21.
//  Copyright © 2021 Renata Gondim Andrade. All rights reserved.
//

import UIKit
import Lottie

class LoadingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var animationView: AnimationView = {
        let view = AnimationView(name: "poke-loading-indicator")
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.animationSpeed = 0.5
        return view
    }()
    
    func play() {
        animationView.play()
    }
    
    func stop() {
        animationView.stop()
    }
}

//  MARK: - ViewCode
extension LoadingView: ViewCode {
    func buildViewHierarchy() {
        addSubview(animationView)
    }
    
    func setupConstraints() {
        animationView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
    func additionalConfigurations() {
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
}
