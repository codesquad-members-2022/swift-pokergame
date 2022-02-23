//
//  Card.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/24.
//

import Foundation

class Card {
    let shape: Shape, rank: Rank
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
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
    
    func filp() -> String {
        var output = ""
        output += "\(shape.rawValue)"
        switch rank {
        case .ace:
            output += "A"
        case .jack:
            output += "J"
        case .queen:
            output += "Q"
        case .king:
            output += "K"
        default:
            output += "\(rank.rawValue)"
        }
        return output
    }
}
