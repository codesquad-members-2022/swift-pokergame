//
//  CardData.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/22.
//

import Foundation

enum CardData {
    enum FaceData: String {
        case spade
        case club
        case heart
        case diamond
    }

    enum NumericData: Int {
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
    }
}

extension CardData.FaceData: CustomStringConvertible {
    var description: String {
        switch self {
        case .spade:
            return "♠"
        case .club:
            return "♣"
        case .heart:
            return "♥"
        case .diamond:
            return "♦"
        }
    }
}

extension CardData.NumericData: CustomStringConvertible {
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            return "\(self.rawValue)"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
}
