//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/22.
//

import Foundation

struct CardDeck: Equatable {
    
    private var deck = [Card]()
    private let originDeck: [Card]
    public var count: Int {
        return self.deck.count
    }
    
    init() {
        let allNumberCases = Card.Number.allCases
        let allSymbolCases = Card.Symbol.allCases
        self.deck = [Card]()
        for numberCase in allNumberCases {
            for symbolCase in allSymbolCases {
                self.deck.append(Card(number: numberCase, symbol: symbolCase))
            }
        }
        self.originDeck = self.deck
    }
    
    init(with cardArray: [Card]) {
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
        if self.deck[count-1] == self.originDeck[count-1] {
            let tempCard = self.deck[count-1]
            self.deck[count-1] = self.deck[count-2]
            self.deck[count-2] = tempCard
        }
    }
    
    public mutating func removeOne() -> Card? {
        return self.deck.isEmpty ? nil : self.deck.removeLast()
    }
    
    public mutating func reset() {
        self.deck = self.originDeck
    }
    
    public func last() -> Card? {
        return self.deck.last
    }
}
