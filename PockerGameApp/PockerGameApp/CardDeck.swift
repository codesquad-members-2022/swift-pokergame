//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/22.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    
    init() {
        var cards = [Card]()
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                cards.append(Card(suit: suit, number: number))
            }
        }
        self.cards = cards
    }
    
    var count: Int {
        return cards.count
    }
    
    func shuffle() {
        
    }
    
    func removeOne() {
        
    }
    
    func reset() {
        
    }
}
