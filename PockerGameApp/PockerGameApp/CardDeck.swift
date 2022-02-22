//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/22.
//

import Foundation

struct CardDeck {
    var cards: [Card]
    
    init() {
        var cards = [Card]()
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                cards.append(Card(suit: suit, number: number))
            }
        }
        self.cards = cards
        shuffle()
    }
    
    var count: Int {
        return cards.count
    }
    
    mutating func shuffle() {
        // Fisher–Yates shuffle
        var cards = self.cards
        var shuffled = [Card]()
        
        while !cards.isEmpty {
            let roll = Int.random(in: 0..<cards.count)
            shuffled.append(cards.remove(at: roll))
        }
        self.cards = shuffled
    }
    
    func removeOne() {
        
    }
    
    func reset() {
        
    }
}
