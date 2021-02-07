//
//  UITableView+EmptyState.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

extension UITableView {
    private static var emptyStateView: EmptyStateView?

    func setEmptyState() {
        guard backgroundView == nil else { return }
        UITableView.emptyStateView = EmptyStateView(frame: backgroundView?.bounds ?? .zero)
        
        guard let emptyStateView = UITableView.emptyStateView else { return }
        emptyStateView.play()
        backgroundView = UITableView.emptyStateView
        self.separatorStyle = .none
    }
    
    func restore() {
        guard
            let emptyStateView = UITableView.emptyStateView,
            backgroundView != nil
        else {
            return
        }
        emptyStateView.stop()
        backgroundView = nil
    }
}
