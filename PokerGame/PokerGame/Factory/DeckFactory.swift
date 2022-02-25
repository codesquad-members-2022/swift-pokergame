//
//  DeckFactory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/24.
//

import Foundation

class DeckFactory {
        
    func makeDeck() -> Deck {
        let cards:[Card] = iterateSuitWithAllRank()
        return Deck(cards: cards)
    }
    
    //MARK: -- MakeDeck함수가 너무 비대해서 기능을 나누었다.
    private func iterateSuitWithAllRank() -> [Card]{
        var cards:[Card] = [Card]()
        for suit in Card.Suit.allCases{
            cards.append(contentsOf: makeSuitForAllRank(suit: suit))
        }
        return cards
    }
    
    private func makeSuitForAllRank(suit:Card.Suit) -> [Card] {
        let suitForAllRank = Card.Rank.allCases.map { Card(suit: suit, rank: $0) }
        return suitForAllRank
    }
}
