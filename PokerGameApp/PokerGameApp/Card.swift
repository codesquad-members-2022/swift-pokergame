//
//  Card.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22 19:00 시작.
//

import Foundation

typealias CardNumber = Card.Number
typealias CardSymbol = Card.Symbol

class Card {
    private let number: CardNumber!
    private let symbol: CardSymbol!

    init(as number: CardNumber, using symbol: CardSymbol) {
        self.number = number
        self.symbol = symbol
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        "\(symbol.rawValue)\(number.encodedNum)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.number == rhs.number && lhs.symbol == rhs.symbol
    }
}
