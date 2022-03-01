//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class Dealer: Player {
    
    private var deck: Deck
    
    init() {
        self.deck = Deck()
        self.deck.shuffle()
        super.init(name: "Dealer")
    }
    
    func popCardFromDeck() -> Card? {
        guard let card = deck.removeOne() else {
            return nil
        }
        return card
    }
    
    func getDeckCount() -> Int {
        return deck.count()
    }
    
    func printDeck() {
        print(deck)
    }
}
