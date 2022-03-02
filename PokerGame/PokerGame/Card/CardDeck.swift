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
    
    func removeOne() -> Card? {
        if self.cardDeck.isEmpty { return nil }
        else {
            return cardDeck.popLast()
        }
    }
    
    func reset() {
        cardDeck = card
    }
    
    init() {
        for suits in Card.Suit.allCases {
            for ranks in Card.Rank.allCases {
                card.append(Card(suit: suits, rank: ranks))
            } }
        cardDeck = card
    }
}

extension CardDeck: CustomStringConvertible {
    var description: String {
        return "\(card)"
    }
}

extension CardDeck: Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.card == rhs.card && lhs.cardDeck == rhs.cardDeck
    }
}
