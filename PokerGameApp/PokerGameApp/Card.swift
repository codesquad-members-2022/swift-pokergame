//
//  Card.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/22.
//

import Foundation

struct Card {
    enum FaceData: String, CustomStringConvertible, CaseIterable {
        case spade
        case club
        case heart
        case diamond
        
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
    
    enum NumericData: Int, CustomStringConvertible, CaseIterable {
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
    
    private let faceData: FaceData
    private let numericData: NumericData
    
    init(faceData: Card.FaceData, numericData: Card.NumericData) {
        self.faceData = faceData
        self.numericData = numericData
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.faceData)\(self.numericData)"
    }
}
