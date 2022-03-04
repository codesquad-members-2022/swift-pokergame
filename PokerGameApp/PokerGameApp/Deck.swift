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
 
    init() {}
    
    func count() -> Int {
        return cards.count
    }
    
    func shuffle() {
        for i in 0...50 {
            let j = Int.random(in: (i+1)...51)
            cards.swapAt(i, j)
        }
    }
    
    func reset() {
        currentCount = 52
        cards = []
    }
    
}
