//
//  Deck.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/25.
//

import Foundation

class Deck {
    var currentCount: Int = 52
    var cards: [Card] = []
 
    init() {
        reset()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func shuffle() {
        for i in 0...50 {
            let j = Int.random(in: (i+1)...51)
            cards.swapAt(i, j)
        }
    }
    
    func removeOne() -> Card {
        let i = Int.random(in: 0...51)
        let tmp = cards[i]
        cards.remove(at: i)
        return tmp
    }
    
    func reset() {
        currentCount = 52
        cards = []
        
        for i in 1...4 {
            for j in 1...13 {
                cards.append(Card(Card.Num(rawValue: j) ?? Card.Num.one, Card.Shape(rawValue: i) ?? Card.Shape.spade))
            }
        }
        print(cards)
        
    }
    
}
