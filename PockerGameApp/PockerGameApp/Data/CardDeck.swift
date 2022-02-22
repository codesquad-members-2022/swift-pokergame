//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/22.
//

import Foundation

// CardDeck은 각각의 고유 인스턴스인 Card들을 담는 단순한 통 개념이므로 Struct로 구현
struct CardDeck{
    private var deck: [Card] = []
    private var removedDeck: [Card] = []
    
    func count() -> Int{
        let count = deck.count
        return count
    }
    
    mutating func shuffle(){
        var shuffledDeck: [Card] = []
        
        while !deck.isEmpty{
            let index = Int.random(in: 0..<deck.count)
            shuffledDeck.append(deck[index])
            deck.remove(at: index)
        }
        
        deck = shuffledDeck
    }
    
    mutating func reset(){
        guard !removedDeck.isEmpty else{
            return
        }
        
        deck.append(contentsOf: removedDeck)
        deck.sort(by: { card1, card2 in
            card1.description > card2.description
        })
        removedDeck.removeAll()
    }
    
    mutating func removeOne() -> Card?{
        guard !deck.isEmpty else{
            return nil
        }
        
        let index = Int.random(in: 0..<deck.count)
        let removeCard = deck[index]
        
        deck.remove(at: index)
        removedDeck.append(removeCard)
        
        return removeCard
    }
    
    init(){
        let cardShapes = Card.Shape.allCases
        var cardShapeIndex = 0
        
        let cardNumbers = Card.CardNumber.allCases
        var numberIndex = 0
        
        while numberIndex < 13{
            let card = Card(number: cardNumbers[numberIndex], shape: cardShapes[cardShapeIndex])
            deck.append(card)
            
            if numberIndex == 12 && deck.count < 52{
                cardShapeIndex += 1
                numberIndex -= 12
            } else{
                numberIndex += 1
            }
        }
        
        deck.sort(by: { card1, card2 in
            card1.description > card2.description
        })
    }
}
