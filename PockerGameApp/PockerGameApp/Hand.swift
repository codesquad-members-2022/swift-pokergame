//
//  Hand.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/16.
//

import Foundation

class Hand {
    private var cards: [Card]
    
    var getCards: [Card] {
        return cards
    }
    
    init() {
        self.cards = [Card]()
    }
    
    func receive(card: Card) {
        self.cards.append(card)
    }
}
