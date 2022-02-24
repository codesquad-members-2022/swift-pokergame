//
//  Card.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/23.
//

import Foundation

class Card {
    
    enum Shape: String {
        case spades = "♠︎"
        case hearts = "♥︎"
        case clubs = "♣︎"
        case diamonds = "♦︎"
    }
    
    enum Number: Int {
        case ace = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case jack = 11
        case queen = 12
        case king = 13
    }
    
    let shape: Shape
    let number: Number
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape.rawValue)\(number.rawValue)"
    }
}

extension Card.Number: CustomStringConvertible {
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return "\(self)"
        }
    }
    
    
}
