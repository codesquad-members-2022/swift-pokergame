//
//  Card+Extension.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/23.
//

import Foundation

extension Card: CustomStringConvertible {
    public var description: String {
        "\(info.symbol.rawValue)\(info.number.encodedNum)"
    }
}

extension Card {
    enum Symbol: String, CaseIterable {
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"

        static var randomElement: Symbol {
            allCases.randomElement()!
        }
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.info == rhs.info
    }
}

extension Card.Number {
    
    static var allRange: ClosedRange<Card.Number> {
        (1...13) as ClosedRange<Card.Number>
    }
    
    static var random: Card.Number {
        allRange.randomElement()!
    }
    
    var encodedNum: String {
        encode()
    }
    
    public var description: String {
        encode()
    }
    
    private func encode() -> String {
        switch self {
        case 1: return "A"
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return String(self)
        }
    }
}
