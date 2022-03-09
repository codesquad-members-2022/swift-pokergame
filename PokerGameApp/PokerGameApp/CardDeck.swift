//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Joobang Lee on 2022/03/01.
//

import Foundation

class PokerCardDeck {
    private var pokercard: [PokerCard] = []
    
    init(){
        makeCardDeck()
    }
    
    func makeCardDeck() {
        for suits in PokerCard.Suit.allCases{
            for ranks in PokerCard.Rank.allCases{
                self.pokercard.append(PokerCard(suits, ranks))
            }
        }
    }
    
    func count() -> Int{
        return pokercard.count
    }
    
    func shuffle(){
        let pokerCount = pokercard.count
        for i in 0..<pokerCount - 1 {
            let randomIndex = Int.random(in: i..<pokerCount)
            let temp = self.pokercard[i]
            
            self.pokercard[i] = self.pokercard[randomIndex]
            self.pokercard[randomIndex] = temp
        }
    }
    
    func removeOne() -> PokerCard{
        return pokercard.removeLast()
    }
    
    func reset(){
        makeCardDeck()
    }
}

