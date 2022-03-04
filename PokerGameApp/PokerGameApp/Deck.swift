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
    
    func reset() {
        currentCount = 52
        cards = []
    }
    
}
