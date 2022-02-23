//
//  Dealer.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class Dealer: Player {
    private let cardDeck = CardDeck()
    
    var cardCount: Int {
        cardDeck.count
    }
    
    init() {
        super.init(name: "dealer")
    }
    
    func cardShuffle() {
        cardDeck.shuffle()
    }
    
    func cardReset() {
        cardDeck.reset()
    }
    
    func removeOne() -> Card? {
        cardDeck.removeOne()
    }
}
