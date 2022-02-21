//
//  Card.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

struct CardData {
    let pattern: CardPattern
    let number: Int
        
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

extension CardData {
    enum CardPattern: String, CaseIterable {
        case spade = "♠"
        case diamond = "♦"
        case heart = "♥"
        case clover = "♣"
    }
}
