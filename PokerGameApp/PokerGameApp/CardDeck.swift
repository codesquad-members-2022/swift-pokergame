//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

struct CardDeck {
    private let originCards : [Card]
    private var cards : [Card]
    var count : Int {
        return cards.count
    }
    init() {
        var tempCardArr : [Card] = []
        for i in Card.Shape.allCases {
            for j in Card.Number.allCases{
                tempCardArr.append(Card(shape: i, number: j))
            }
        }
        originCards = tempCardArr
        cards = originCards
    }
    mutating func shuffle() {
        for i in 0..<self.count {
            guard let randomIndex = (i..<self.count).randomElement() else {continue}
            let tempCard = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = tempCard
        }
    }
    mutating func removeOne() -> Card? {
        return self.cards.popLast()
    }
    mutating func reset() {
        cards = originCards
    }
}
