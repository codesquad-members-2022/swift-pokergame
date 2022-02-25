//
//  Hand.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
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
