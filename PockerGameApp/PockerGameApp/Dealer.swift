//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

struct Dealer: Gamer {
    
    var wholeDeck = CardDeck()
    var cardDeck = CardDeck.init(with: [])
    var countRemainingCards: Int {
        return wholeDeck.count
    }
    
    public mutating func pickCard() -> Card? {
        wholeDeck.shuffle()
        return wholeDeck.removeOne()
    }
    
    public mutating func getCard(_ card: Card) {
        self.cardDeck.add(card)
    }
}
