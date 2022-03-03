//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

class Dealer: Participant {
    override var description: String {
        return "😎Dealer: \(self.show()))"
    }
    
    private var cardDeck = CardDeck()
    
    
    func remove(cardDeck: CardDeck) -> Card? {
        let currentCardDeck = cardDeck
        return currentCardDeck.removeOne()
    }
    
    
    func give(cardDeck: CardDeck) -> CardDeck? {
        return cardDeck
    }
}
