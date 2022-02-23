//
//  Dealer.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

class Dealer : Player {
    private var cardDeck : CardDeck
    var cardDeckCount : Int {
        return cardDeck.count
    }
    init(cardDeck : CardDeck) {
        self.cardDeck = cardDeck
        super.init(name: "dealer")
    }
    func draw() -> Card?{
        return self.cardDeck.removeOne()
    }
}
