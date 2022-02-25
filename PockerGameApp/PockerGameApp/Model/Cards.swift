//
//  Cards.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/25.
//

import Foundation

struct Cards {
    var bunchOfCards: [Card]
    var count: Int {
        return bunchOfCards.count
    }
    
    init(with bunchOfCards: [Card]) {
        self.bunchOfCards = bunchOfCards
    }
    
    init() {
        self.init(with: [])
    }
    
    subscript(index: Int) -> Card {
        return bunchOfCards[index]
    }
    
    mutating func add(_ card: Card) {
        bunchOfCards.append(card)
    }
    
    mutating func add(bunch: [Card]) {
        bunchOfCards.append(contentsOf: bunch)
    }
    
    mutating func swapAt(_ index1: Int, _ index2: Int) {
        let temp = bunchOfCards[index1]
        bunchOfCards[index1] = bunchOfCards[index2]
        bunchOfCards[index2] = temp
    }
    
    mutating func pop() -> Card? {
        return bunchOfCards.popLast()
    }
}
