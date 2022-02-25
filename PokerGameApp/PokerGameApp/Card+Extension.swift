//
//  Card+Extension.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/23.
//

import Foundation

extension Card {
    enum Number: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case eleven = 11
        case twelve = 12
        case thirteen = 13
    }
    
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

extension CardNumber { // Card.Number
    static var random: Card.Number {
        self.allCases.randomElement()!
    }
    
    var encodedNum: String {
        encode()
    }
    
    public var description: String {
        encode()
    }
    
    private func encode() -> String {
        switch self {
        case .one: return "A"
        case .eleven: return "J"
        case .twelve: return "Q"
        case .thirteen: return "K"
        default: return "\(self.rawValue)"
        }
    }
}

extension CardSymbol { // Card.Symbol
    static var random: Card.Symbol {
        self.allCases.randomElement()!
    }
}
