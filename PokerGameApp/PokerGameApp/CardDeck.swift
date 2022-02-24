//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

struct CardDeck {
    private var originCards : Cards = Cards()
    private var cards : Cards = Cards()
    var count : Int {
        return cards.count
    }

    init() {
        setNewDeck()
        cards = originCards
    }
    
    mutating func shuffle() {
        for cardIndex in 0..<self.count {
            guard let randomIndex = (cardIndex..<self.count).randomElement() else {continue}
            let tempCard = cards.lookUP(index: cardIndex)
            cards.swapCard(at: cardIndex, with: cards.lookUP(index: randomIndex))
            cards.swapCard(at: randomIndex, with: tempCard)
        }
    }
    
    mutating func removeOne() -> Card? {
        return self.cards.pop()
    }
    
    mutating func reset() {
        cards = originCards
    }
    
    mutating private func setNewDeck() {
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases{
                self.originCards.add(card:Card(shape: shape, number: number))
            }
        }
    }
    
}

extension CardDeck : Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
    
}
