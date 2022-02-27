//
//  CardDeckFactory.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/25.
//

import Foundation

protocol Factory {
    associatedtype T
    static func create() -> T
}

struct CardDeckFactory: Factory {
    // MARK: - Properties
    private static let ranks = Card.Rank.allCases
    private static let suits = Card.Suit.allCases
    
    // MARK: - Methods
    static private func createCardsBySuit(suit: Card.Suit) -> [Card] {
        var card: [Card] = []
        
        for rank in self.ranks {
            card.append(Card(rank: rank, suit: suit))
        }
        
        return card
    }
    
    static func create() -> CardDeck {
        let cards = self.suits.flatMap(createCardsBySuit(suit:))
        return CardDeck(cards: cards)
    }
}
