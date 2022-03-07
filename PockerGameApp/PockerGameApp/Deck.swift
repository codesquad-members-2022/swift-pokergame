//
//  Deck.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/07.
//

import Foundation

struct Deck {
    
    private var cardDeck: [Card] = []
    
    init() {
        makeDeck()
    }
    
    mutating func makeDeck() {
        for shape in Card.Suitshape.allCases {
            for rank in Card.SuitNumber.allCases {
                cardDeck.append(Card(suitShape: shape, suitCardNumber: rank))
            }
        }
    }
    
    func count() -> Int {
        return cardDeck.count
    }
    
    func shuffle() {
        
    }
    
    func removeOne() {
        
    }
    
    func reset() {
        
    }
}
