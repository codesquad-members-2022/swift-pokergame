//
//  Factory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/24.
//

import Foundation

class CardFactory {
    
    func makeDesignatedCard(suit:Card.Suit, rank: Card.Rank) -> Card {
        let card = Card(suit: suit, rank: rank)
        return card
    }
    
    func makeRandomCard() -> Card {
        let randomRank = makeRandomRank()
        let randomSuit = makeRandomSuit()
        let randomCard = Card(suit: randomSuit, rank: randomRank)
        return randomCard
    }
    
    func makeDeck() -> Deck {
        let cards:[Card] = iterateSuitWithAllRank()
        return Deck(cards: cards)
    }
    
    //MARK: -- Random한 Card를 만드는 Suit와 Rank의 함수를 분리했다.
    private func makeRandomSuit() -> Card.Suit {
        return Card.Suit.allCases.randomElement() ?? .clover
    }
    
    private func makeRandomRank() -> Card.Rank {
        return Card.Rank.allCases.randomElement() ?? .Jack
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
