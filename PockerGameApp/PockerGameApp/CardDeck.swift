//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/22.
//

import Foundation

struct CardDeck {
    
    private var deck: [Card]
    private let originDeck: [Card]
    public var count: Int {
        return self.deck.count
    }
    
    init() {
        let allNumberCases = Card.Number.allCases
        let allSymbolCases = Card.Symbol.allCases
        var deck = [Card]()
        
        for numberCase in allNumberCases {
            for symbolCase in allSymbolCases {
                deck.append(Card(number: numberCase, symbol: symbolCase))
            }
        }
        
        self.deck = deck
        self.originDeck = deck
    }
    
    init(_ cardArray: [Card]) {
        self.deck = cardArray
        self.originDeck = cardArray
    }
    
    public mutating func shuffle() { // Knuth Shuffle 로직 사용하여 구현
        let count = self.count
        
        for indexToSwap1 in 0..<count-1 {
            let indexToSwap2 = Int.random(in: indexToSwap1..<count)
            let tempCard = self.deck[indexToSwap1]
            self.deck[indexToSwap1] = self.deck[indexToSwap2]
            self.deck[indexToSwap2] = tempCard
        }
    }
    
    public mutating func removeOne() -> Card? {
        if self.deck.isEmpty { return nil }
        else {
            return self.deck.removeLast()
        }
    }
    
    public mutating func reset() {
        self.deck = self.originDeck
    }
}

extension CardDeck: Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        if lhs.deck == rhs.deck { return true }
        else { return false }
    }
}
