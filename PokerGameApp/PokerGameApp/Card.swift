//
//  Card.swift
//  Pocker Game
//
//  Created by 송태환 on 2022/02/24.
//

import Foundation

class Card {
    
    enum Suit: Int {
        case clover = 1, diamond, heart, spade
    }
    
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
    }
    
    private let suit: Suit
    private let rank: Rank

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
}

extension Card: Comparable, CustomStringConvertible {
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.rank == lhs.rank {
            return lhs.suit < rhs.suit
        }
        
        return lhs.rank < rhs.rank
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.rank == rhs.rank
    }
    
    var description: String {
        return "\(self.suit) \(self.rank)"
    }
    
}

extension Card.Suit: Comparable, CustomStringConvertible {
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
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

extension Card.Rank: Comparable, CustomStringConvertible {
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
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
