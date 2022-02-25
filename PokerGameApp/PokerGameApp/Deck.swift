//
//  Deck.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/24.
//

import Foundation

struct Deck {
    // 52장의 카드
    
    private var cardDeck = Array<Card?>()
    private var initCardNumber = 13
    
    init() {
        reset()
    }
    
    func count() -> Int {
        return cardDeck.count
    }
    
    mutating func shuffle() {
        var cardDeckIndex = cardDeck.count - 1
        for i in 1...cardDeck.count {
            let tempCard = cardDeck[cardDeckIndex]
            let randomIndex = Int.random(in: 1...cardDeckIndex)
            cardDeck[cardDeckIndex] = cardDeck[randomIndex]
            cardDeck[randomIndex] = tempCard
            cardDeckIndex -= 1
        }
    }
    
    mutating func removeOne() -> Card? {
        if cardDeck.isEmpty {
            return nil
        }
        return cardDeck.removeLast()
    }
    
    mutating func reset() {
        self.cardDeck = Array<Card>()
        for i in 1...initCardNumber {
            self.cardDeck.append(Card(shape: .spades, number: Card.Number.init(rawValue: i) ?? .ace))
            self.cardDeck.append(Card(shape: .diamonds, number: Card.Number.init(rawValue: i) ?? .ace))
            self.cardDeck.append(Card(shape: .hearts, number: Card.Number.init(rawValue: i) ?? .ace))
            self.cardDeck.append(Card(shape: .clubs, number: Card.Number.init(rawValue: i) ?? .ace))
        }
    }
}

extension Deck: CustomStringConvertible {
    var description: String {
        var deckInfo = "Deck Info\n"
        for card in cardDeck {
            if let cardContent = card {
                deckInfo += "\(cardContent.shape)\(cardContent.number)\n"
            }
        }
        return deckInfo
    }
}
