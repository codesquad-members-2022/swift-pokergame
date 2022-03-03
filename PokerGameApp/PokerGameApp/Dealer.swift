//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

class Dealer: Participant {
    override var description: String {
        return "😎Dealer: \(self.cards)"
    }
    
    private var cardDeck = CardDeck()
    
    
    func remove(cardDeck: CardDeck) -> Card? {
        let currentCardDeck = cardDeck
        return currentCardDeck.removeOne()
    }
    
    
    func returnCardDeck(to pokerGame: CardDeck) -> CardDeck? {
        return pokerGame
    }
}
