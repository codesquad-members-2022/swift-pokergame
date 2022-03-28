//
//  Card.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/24.
//

import Foundation

enum Shape: Character {
    case spade = "♤"
    case heart = "♡"
    case diamond = "◇"
    case club = "♧"
}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case ace = 1, jack = 11, queen = 12, king = 13
}

class Card: CustomStringConvertible {
    let shape: Shape, rank: Rank
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    
    var description: String {
        switch rank {
        case .ace:
            return "\(shape.rawValue)A"
        case .jack:
            return "\(shape.rawValue)J"
        case .queen:
            return "\(shape.rawValue)Q"
        case .king:
            return "\(shape.rawValue)K"
        default:
            return "\(shape.rawValue)\(rank.rawValue)"
        }
    }
}
