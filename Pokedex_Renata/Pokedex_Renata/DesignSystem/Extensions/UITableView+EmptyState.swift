//
//  UITableView+EmptyState.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 25/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String = "Gotta catch them! 🔎") {
        let messageLabel = UILabel(
            frame: CGRect(x: .zero, y: .zero, width: self.bounds.size.width, height: self.bounds.size.height)
        )
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.itemTitle
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
    }
}
