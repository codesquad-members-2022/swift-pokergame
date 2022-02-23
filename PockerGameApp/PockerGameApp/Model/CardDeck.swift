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
        for numberCase in allNumberCases {
            for symbolCase in allSymbolCases {
                self.deck.append(Card(number: numberCase, symbol: symbolCase))
            }
        }
        self.originDeck = deck
    }
    
    init(with cardArray: [Card]) {
        self.deck.append(contentsOf: cardArray)
        self.originDeck = cardArray
    }
    
    public mutating func shuffle() { // Knuth Shuffle 로직 사용하여 구현
        let count = self.count
        
        for indexToSwap1 in 0..<count-1 {
            let indexToSwap2 = Int.random(in: indexToSwap1..<count)
            self.deck.swapAt(indexToSwap1, indexToSwap2)
        }
        if self.deck[count-1] == self.originDeck[count-1] && count > 1 {
            self.deck.swapAt(count-1, count-2)
        }
    }
    
    public mutating func removeOne() -> Card? {
        return self.deck.popLast()
    }
    
    public mutating func reset() {
        self.deck = self.originDeck
    }
    
    public func last() -> Card? { // Test시 사용하기 위한 메서드
        return self.deck.last
    }
    
    public mutating func add(_ card: Card) {
        self.deck.append(card)
    }
}
