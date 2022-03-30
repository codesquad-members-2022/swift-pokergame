//
//  Card.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/24.
//

import Foundation

enum Shape: Comparable {
    
    case club
    case heart
    case diamond
    case spade
    
    var picture: String {
        switch self {
        case .spade:
            return "♤"
        case .diamond:
            return "◇"
        case .heart:
            return "♡"
        case .club:
            return "♧"
        }
    }
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
            return "\(shape.picture)A"
        case .jack:
            return "\(shape.picture)J"
        case .queen:
            return "\(shape.picture)Q"
        case .king:
            return "\(shape.picture)K"
        default:
            return "\(shape.picture)\(rank.rawValue)"
        }
    }
}
