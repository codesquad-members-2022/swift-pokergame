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
    var cards = [Card]()
    
    
    func remove(card: CardDeck) -> Card? {
        let currentCardDeck = card
        return currentCardDeck.removeOne()
    }
    
    
    func returnCardDeck(to pokerGame: CardDeck) -> CardDeck? {
        return pokerGame
    }
    
    
    override func receive(card: Card) {
        cards.append(card)
    }
}
