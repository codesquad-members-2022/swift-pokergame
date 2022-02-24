//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

struct CardDeck {
    private var originCards : [Card] = []
    private var cards : [Card] = []
    var count : Int {
        return cards.count
    }
    var showCards : [String] {
        var tempCards : [String] = []
        for card in cards {
            tempCards.append("\(card)")
        }
        return tempCards
    }
    
    init() {
        setNewDeck()
        cards = originCards
    }
    
    mutating func shuffle() {
        for cardIndex in 0..<self.count {
            guard let randomIndex = (cardIndex..<self.count).randomElement() else {continue}
            let tempCard = cards[cardIndex]
            cards[cardIndex] = cards[randomIndex]
            cards[randomIndex] = tempCard
        }
    }
    
    mutating func removeOne() -> Card? {
        return self.cards.popLast()
    }
    
    mutating func reset() {
        cards = originCards
    }
    
    mutating private func setNewDeck() {
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases{
                self.originCards.append(Card(shape: shape, number: number))
            }
        }
    }
    
}

extension CardDeck : Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
    
}
