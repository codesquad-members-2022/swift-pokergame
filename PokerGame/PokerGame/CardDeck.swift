//
//  CardDeck.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/23.
//

import Foundation

class CardDeck {

    private var card: [Card] = []
    private var cardDeck: [Card]
    
    func count() -> Int {
        return cardDeck.count
    }
    
    func shuffle() {
        for shuffle in 0..<cardDeck.count - 1 {
            let randomIndex = Int.random(in: 0..<cardDeck.count)
            let temp = cardDeck[shuffle]
            
            cardDeck[shuffle] = cardDeck[randomIndex]
            cardDeck[randomIndex] = temp
        }
    }
    
    func removeOne() -> Card {
        return cardDeck.removeLast()
    }
    
    func reset() {
        cardDeck = card
    }
    
    init() {
        for shapes in Card.Shape.allCases {
            for numbers in Card.Number.allCases {
                card.append(Card(shape: shapes, number: numbers))
            } }
        cardDeck = card
    }
}

extension CardDeck: CustomStringConvertible {
    var description: String {
        return "\(card)"
    }
}

