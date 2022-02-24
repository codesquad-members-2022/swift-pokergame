//
//  Card.swift
//  Pocker Game
//
//  Created by 송태환 on 2022/02/24.
//

import Foundation

class Card {
    enum Suit: CustomStringConvertible {
        case heart, diamond, spade, clover
        
        var description: String {
            switch self {
            case .heart:
                return "❤️"
            case .clover:
                return "🍀"
            case .diamond:
                return "♦️"
            case .spade:
                return "♠️"
            }
        }
    }
    
    enum Rank: Int, CustomStringConvertible {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
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
                return String(self.rawValue)
            }
        }
    }
    
    var suit: Suit
    var rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.suit) \(self.rank)"
    }
}
