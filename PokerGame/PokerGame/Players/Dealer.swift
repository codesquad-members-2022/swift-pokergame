//
//  Dealer.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/27.
//

import Foundation

class Dealer: Player {
    
    private var cardDeck = CardDeck()

    func shuffleCards() {
        self.cardDeck.shuffle()
    }
    
    func handOutCards(stud: Stud) {
        for _ in 0..<stud.rawValue {
            guard let cards = cardDeck.removeOne() else { return }
            
            getCard(card: cards)
        }
    }
    
    convenience init() {
        self.init(name: "딜러")
    }
    
}



