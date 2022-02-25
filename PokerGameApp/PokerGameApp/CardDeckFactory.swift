//
//  CardDeckFactory.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/25.
//

import Foundation

protocol Factory {
    associatedtype T
    func create() -> T
}

struct CardDeckFactory: Factory {
    // MARK: - Properties
    private let ranks = Card.Rank.allCases
    private let suits = Card.Suit.allCases
    
    // MARK: - Methods
    private func createCardsBySuit(suit: Card.Suit) -> [Card] {
        var card: [Card] = []
        
        for rank in self.ranks {
            card.append(Card(rank: rank, suit: suit))
        }
        
        return card
    }
    
    func create() -> CardDeck {
        let cards = self.suits.flatMap(createCardsBySuit(suit:))
        return CardDeck(cards: cards)
    }
}
