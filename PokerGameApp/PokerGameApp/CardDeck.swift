//
//  CardDeck.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/23.
//

import Foundation

struct CardDeck {
    
    private var cards: [Card] = []
    
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
    
    mutating func draw() -> Card? {
        return count > 0 ? self.cards.remove(at: Int.random(in: (0..<count))) : nil
    }
    
    mutating func reset() {
        cards.removeAll()
        setUpCards()
    }
}

extension CardDeck: Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
}
