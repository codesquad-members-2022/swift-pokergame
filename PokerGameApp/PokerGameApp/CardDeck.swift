//
//  CardDeck.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/23.
//

import Foundation

struct CardDeck {
    private var cards: [Card] = [] //private?
    
    var count: Int {
        return cards.count
    }
    
    init() {
        setUpCards()
    }
    
    mutating func setUpCards() {
        let faces = Card.FaceData.allCases
        let numerics = Card.NumericData.allCases
        
        faces.forEach { faceData in
            numerics.forEach { numericData in
                cards.append(Card(faceData: faceData, numericData: numericData))
            }
        }
    }
    
    mutating func shuffle() {
        var maxIndex = count - 1
        
        while maxIndex != 0 {
            let randomIndex = Int.random(in: (0...maxIndex))
            self.cards.swapAt(randomIndex, maxIndex)
            maxIndex -= 1
        }
    }
    
    mutating func draw() -> Card {
        return self.cards.remove(at: Int.random(in: (0..<count)))
    }
    
    mutating func reset() {
        cards.removeAll()
        setUpCards()
    }
}
