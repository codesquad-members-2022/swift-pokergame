//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/23.
//

import Foundation

struct CardDeck {
    
    private var deck: [Card] = Array()
    var count: Int {
        return deck.count
    }
    
    init() {
        makeCardDeck()
    }
    
    mutating func makeCardDeck() {
        for symbol in Card.Symbol.allCases {
            for rank in Card.Rank.allCases {
                deck.append(Card(symbol: symbol, rank: rank))
            }
        }
    }
    
    mutating func shuffle() {
        for changedIndex in 0..<count-1 {
            let randomIndex = Int.random(in: changedIndex..<count)
            let temp = deck[changedIndex]
            deck[changedIndex] = deck[randomIndex]
            deck[randomIndex] = temp
        }
        
    }
    
    mutating func removeOne() -> Card {
        
        let randomIndex = Int.random(in: 0..<count)
        let removedCard = deck.remove(at: randomIndex)
        return removedCard
        
    }
    
    mutating func reset() {
        deck.removeAll()
        makeCardDeck()
    }
    
    
    
}
