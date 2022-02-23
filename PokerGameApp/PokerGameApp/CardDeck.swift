//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/23.
//

import Foundation

struct CardDeck {
    
    private var deck: [Card] = Array()
    
    
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
    
    func count() -> Int {
        return deck.count
    }
    
    mutating func shuffle() {
        
        let length = self.count()
        
        for i in 0..<length-1 {
            let randomIndex = Int.random(in: i..<length)
              
            let temp = deck[i]
            deck[i] = deck[randomIndex]
            deck[randomIndex] = temp
            
        }
        
    }
    
    mutating func removeOne() -> Card {
        
        let length = self.count()
        let randomIndex = Int.random(in: 0..<length)
        
        let removedCard = deck.remove(at: randomIndex)
        return removedCard
        
    }
    
    mutating func reset() {
        deck.removeAll()
        makeCardDeck()
    }
    
    
    
}
