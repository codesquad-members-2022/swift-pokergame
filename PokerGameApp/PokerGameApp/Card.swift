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
    
    init?(shape: Shape, symbol: Symbol) {
        if SymbolInt.init(rawValue: symbol.symbolInt.rawValue) == nil {
            return nil
        }
        self.shape = shape
        self.symbol = symbol
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape.description)\(symbol)"
    }
}

extension Card.Shape: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
}

