//
//  Card.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/23.
//

import Foundation
import UIKit

class Card {
    
    enum Shape: String {
        case spades = "♠︎"
        case hearts = "♥︎"
        case clubs = "♣︎"
        case diamonds = "♦︎"
    }
    
    let shape: Shape
    let symbol: Symbol
    
    init(shape: Shape, symbol: Symbol) {
        self.shape = shape
        self.symbol = symbol
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape.description)\(symbol.description)"
    }
}

extension Card.Shape: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
}

