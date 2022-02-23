//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/23.
//

import Foundation

struct CardDeck {
    private let initialCards: [Card]
    private var cards: [Card]
    var count: Int {
        return cards.count
    }
    
    
    init() {
        var cards = [Card]()
        
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(shape: shape, number: number))
            }
        }
        
        self.initialCards = cards
        self.cards = cards
    }
    
    
    mutating func shuffle() {
        for index in 0..<count - 1 {
            let temp = cards[index]
            let randomIndex = Int.random(in: index..<count)
            cards[index] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    
    mutating func removeOne() -> Card? {
        return count != 0 ? cards.remove(at: Int.random(in: 0..<count)) : nil
    }
    
    
    mutating func reset() {
        self.cards = initialCards
    }
}


extension CardDeck: CustomStringConvertible {
    var description: String {
        return "\(cards)"
    }
}
