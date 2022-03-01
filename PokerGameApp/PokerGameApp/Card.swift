//
//  Card.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/23.
//

import Foundation
import UIKit

class Card {
    
    let shape: Shape
    let symbol: Symbol
    
    init(shape: Shape, symbol: Symbol) {
        self.shape = shape
        self.symbol = symbol
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape)\(symbol)"
    }
}

