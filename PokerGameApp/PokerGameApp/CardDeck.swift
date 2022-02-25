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
    }
    
    // MARK: - Methods
    mutating func removeOne() -> Card? {
        guard let card = self.cards.popLast() else {
            return nil
        }
        
        self.cache.append(card)
        
        return card
    }
    
    mutating func shuffle() {
        
    }
    
    mutating func reset() {
        self.cards = self.cards.isEmpty ? self.cache : self.cards + self.cache
        self.cache = []
        self.shuffle()
    }
}
