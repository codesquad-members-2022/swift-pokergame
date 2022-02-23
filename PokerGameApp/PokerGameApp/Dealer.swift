//
//  Dealer.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

struct Dealer {
    var name = "Dealer"
    private var cardDeck : CardDeck
    private var hand : [Card] = []
    
    init(cardDeck : CardDeck) {
        self.cardDeck = cardDeck
    }
    mutating func getCard(card: Card) {
        self.hand.append(card)
    }
    
    mutating func draw() -> Card?{
        return self.cardDeck.removeOne()
    }
}
