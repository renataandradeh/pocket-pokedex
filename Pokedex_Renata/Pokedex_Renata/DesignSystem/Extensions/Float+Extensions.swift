//
//  Float+Extensions.swift
//  Pokedex_Renata
//
//  Created by Renata Andrade on 06/02/21.
//  Copyright © 2021 Renata Gondim Andrade. All rights reserved.
//

import Foundation

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    var getIntPart: String {
        return String(self / 1)
    }
    
    var getDecimalPart: String {
        return String(self.truncatingRemainder(dividingBy: 1))
    }
}
