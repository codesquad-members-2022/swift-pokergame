//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/22.
//

import Foundation

class CardDeck{
    private var deck: [Card] = []
    // reset시, 다시 거둬들일 카드 기록
    private var removedCards: [Card] = []
    
    func count() -> Int{
        let count = deck.count
        return count
    }
    
    func shuffle(){
        var shuffledDeck: [Card] = []
        
        while !deck.isEmpty{
            let index = Int.random(in: 0..<deck.count)
            shuffledDeck.append(deck[index])
            deck.remove(at: index)
        }
        
        deck = shuffledDeck
    }
    
    func reset(){
        guard !removedCards.isEmpty else{
            return
        }
        
        deck.append(contentsOf: removedCards)
        removedCards.removeAll()
        deck.shuffle()
    }
    
    func removeOne() -> Card?{
        guard let removeCard = deck.last else{
            return nil
        }
        
        deck.removeLast()
        removedCards.append(removeCard)
        
        return removeCard
    }
    
    init(){
        let cardShapes = Card.Shape.allCases
        let cardNumbers = Card.CardNumber.allCases
        
        cardShapes.forEach{ shape in
            cardNumbers.forEach{ number in
                let card = Card(number: number, shape: shape)
                deck.append(card)
            }
        }
        
        deck.sort(by: { card1, card2 in
            card1.description > card2.description
        })
    }
}
