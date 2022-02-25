//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/22.
//

import Foundation

struct CardDeck {
    
    private var deck = Cards()
    private let originDeck: Cards
    public var count: Int {
        return self.deck.count
    }
    
    init() {
        let allNumberCases = Card.Number.allCases
        let allSymbolCases = Card.Symbol.allCases
        for numberCase in allNumberCases {
            for symbolCase in allSymbolCases {
                self.deck.add(Card(number: numberCase, symbol: symbolCase))
            }
        }
        self.originDeck = self.deck
    }
    
    init(with cardArray: [Card]) {
        self.deck.add(bunch: cardArray)
        self.originDeck = self.deck
    }
    
    public mutating func shuffle() { // Knuth Shuffle 로직 사용하여 구현
        let count = self.count
        
        for indexToSwap1 in 0..<count-1 {
            let indexToSwap2 = Int.random(in: indexToSwap1..<count)
            deck.swapAt(indexToSwap1, indexToSwap2)
        }
        if deck[count-1] == originDeck[count-1] && count > 1 {
            deck.swapAt(count-1, count-2)
        }
    }
    
    public mutating func removeOne() -> Card? {
        return deck.pop()
    }
    
    public mutating func reset() {
        self.deck = self.originDeck
    }
    
    public mutating func add(_ card: Card) {
        self.deck.add(card)
    }
}
