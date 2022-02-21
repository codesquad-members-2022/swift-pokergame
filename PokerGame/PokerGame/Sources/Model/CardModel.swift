//
//  Card.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class CardModel {
    let pattern: CardPattern
    let number: Int
    
    init?(pattern: CardPattern, number: Int) {
        guard number > 0 && number <= 13 else {
            return nil
        }
        self.pattern = pattern
        self.number = number
    }
    
    func toString() -> String {
        "\(pattern.rawValue)\(numberToString())"
    }
    
    func numberToString() -> String {
        switch number {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(number)
        }
    }
}

extension CardModel {
    enum CardPattern: String {
        case spade = "♠"
        case diamond = "♦"
        case heart = "♥"
        case clover = "♣"
    }
}
