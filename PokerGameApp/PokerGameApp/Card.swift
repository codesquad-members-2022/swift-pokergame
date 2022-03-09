//
//  Card.swift
//  PokerGameApp
//
//  Created by Joobang Lee on 2022/02/25.
//

import Foundation
import QuartzCore

class PokerCard {
    enum Suit: Character, CaseIterable {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank: Int, CaseIterable {
        case Ace = 1, two, three, four, five, six, seven, eight, nine, ten, Jack, Queen, King
    }
    
    var suit: Suit
    var rank: Rank
    let displayCard: String
    
    init(_ suit: Suit, _ rank: Rank) {
        self.suit = suit
        self.rank = rank
        switch rank{
        case .Ace:
            displayCard = "\(suit.rawValue)A"
        case .Jack:
            displayCard = "\(suit.rawValue)J"
        case .Queen:
            displayCard = "\(suit.rawValue)Q"
        case .King:
            displayCard = "\(suit.rawValue)K"
        default :
            displayCard = "\(suit.rawValue)\(rank.rawValue)"
        }
    }
}

extension PokerCard: CustomStringConvertible {
    var description: String {
        return displayCard
    }
}

