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
    
//  ‘카드’라는 객체를 ‘카드덱'이라는 또 다른 객체에 넣는다
//  ‘카드'의 객체가 가지고 있는 속성 = 모양, 숫자
    mutating func makeDeck() {
        for shape in Card.Suitshape.allCases {
            for rank in Card.Rank.allCases {
                cardDeck.append(Card(suitShape: shape, cardRank: rank))
            }
        }
    }
    
//  ‘카드덱’의 객체가 가지고 있는 것은 위 범주를 포함하고 52개라는 카드의 개수
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
    
    mutating func removeOne() -> Card {
           return self.cardDeck.removeFirst()
    }
    
    mutating func reset() {
        cardDeck.removeAll()
        makeDeck()
    }
    
}
