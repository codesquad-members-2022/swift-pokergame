//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/22.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    private var defaultCards: [Card]
    
    public init() {
        var cards = [Card]()
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                cards.append(Card(suit: suit, number: number))
            }
        }
        self.defaultCards = cards
        self.cards = defaultCards
    }
    
    public var count: Int {
        return cards.count
    }
    
    public mutating func shuffle() {
        // Mordern Fisher-Yates Shuffle (in-place)
        for i in 0..<cards.count-1 {
            let roll = Int.random(in: 0..<cards.count)
            cards.swapAt(i, roll)
        }
    }
    
    public mutating func draw() -> Card? {
        return cards.popLast()
    }
    
    public mutating func reset() {
        self.cards = defaultCards
    }
}

extension CardDeck: CustomStringConvertible {
    var description: String {
        return cards.reduce("") { partialResult, card in
            "\(partialResult) \(card)"
        }
    }
}
