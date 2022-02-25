//
//  CardDeck.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/24.
//

import Foundation

struct CardDeck {
    // MARK: - Properties
    private var cache = Array<Card>()
    private var cards: [Card]
    
    var count: Int {
        return self.cards.count
    }
    
    // MARK: - Initializer
    init(cards: [Card]) {
        self.cards = cards
        self.shuffle()
    }
    
    // MARK: - Methods
    private mutating func swap(_ i: Int, _ j: Int) {
        let card = self.cards[j]
        self.cards[j] = self.cards[i]
        self.cards[i] = card
    }
    
    mutating func removeOne() -> Card? {
        guard let card = self.cards.popLast() else {
            return nil
        }
        
        self.cache.append(card)
        
        return card
    }
    
    mutating func shuffle() {
        var i = self.count - 1
        
        while i > 0 {
            let j = Int.random(in: 0...i)
            self.swap(i, j)
            i -= 1
        }
    }
    
    mutating func reset() {
        self.cards = self.cards.isEmpty ? self.cache : self.cards + self.cache
        self.cache = []
    }
}

extension CardDeck: CustomStringConvertible {
    var description: String {
        return self.cards.description
    }
}
