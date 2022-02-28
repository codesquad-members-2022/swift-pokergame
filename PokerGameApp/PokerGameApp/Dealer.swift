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
    
    func pickCard() -> Card? {
        guard let card = deck.removeOne() else {
            return nil
        }
        return card
    }
    
    func addCard(_ card: Card) {
        cards.append(card)
    }
    
    func getCardsCount() -> Int {
        return cards.count
    }
    
    func getDeckCount() -> Int {
        return deck.count()
    }
    
}
