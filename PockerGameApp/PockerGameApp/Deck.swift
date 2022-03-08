//
//  Deck.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/07.
//

import Foundation
import CoreImage

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
    
    mutating func shuffle() {
        let length = self.count()
        
        for index in 0..<length-1 {
            let randomIndex = Int.random(in: index..<length)
            
            let temp = cardDeck[index]
            cardDeck[index] = cardDeck[randomIndex]
            cardDeck[randomIndex] = temp
        }
    }
    
    func removeOne() {
        
    }
    
    func reset() {
        
    }
}
