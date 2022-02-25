//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class Dealer {
    
    private var deck: Deck
    private var cards: Array<Card>
    
    init() {
        self.deck = Deck()
        self.deck.shuffle()
        self.cards = Array<Card>()
    }
    
    func serveCard() -> Card? {
        guard let card = deck.removeOne() else {
            return nil
        }
        return card
    }
    
    func serveCardToMe() {
        guard let card = deck.removeOne() else {
            return
        }
        self.cards.append(card)
    }
}
