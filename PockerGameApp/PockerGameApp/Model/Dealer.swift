//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class Dealer {
    
    private var wholeDeck = CardDeck()
    private var cardDeck = [Card]()
    var countRemainingCards: Int {
        return wholeDeck.count
    }
    
    public func pickCard() -> Card? {
        return wholeDeck.removeOne()
    }
    
    public func receiveCard(_ card: Card) {
        self.cardDeck.append(card)
    }
    
    public func shuffleWholeDeck() {
        self.wholeDeck.shuffle()
    }
}
