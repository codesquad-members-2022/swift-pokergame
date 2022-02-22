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
        // Mordern Fisher-Yates Shuffle (in-place)
        for i in 0..<cards.count-1 {
            let roll = Int.random(in: 0..<cards.count)
            cards.swapAt(i, roll)
        }
    }
    
    mutating func draw() -> Card {
        return cards.removeLast()
    }
    
    func reset() {
        
    }
}
