//
//  CardDeck.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/24.
//

import Foundation

struct CardDeck {
    var count: Int {
        return self.cards.count
    }
    
    private var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    mutating func shuffle() {
        
    }
    
    mutating func removeOne() -> Card? {
        guard let card = self.cards.popLast() else {
            return nil
        }
        
        return card
    }
    
    mutating func reset() {
        
    }
    
}
