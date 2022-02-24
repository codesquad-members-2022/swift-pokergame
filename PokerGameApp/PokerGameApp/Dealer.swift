//
//  Dealer.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

class Dealer : Player {
    private var cardDeck : CardDeck = CardDeck()
    var cardDeckCount : Int {
        return cardDeck.count
    }
    init() {
        super.init(name: "dealer")
    }
    func draw() -> Card?{
        return self.cardDeck.removeOne()
    }
}
