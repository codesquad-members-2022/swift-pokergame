//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/23.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    private var count: Int {
        return cards.count
    }
    
    init() {
        var cards = [Card]()
        
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(shape: shape, number: number))
            }
        }
        
        self.cards = cards
        print("카드 전체를 초기화했습니다.\n총 \(count)장의 카드가 있습니다.")
    }
    
    mutating func shuffle() {
        for index in 0..<count - 1 {
            let temp = cards[index]
            let randomIndex = Int.random(in: index..<count)
            cards[index] = cards[randomIndex]
            cards[randomIndex] = temp
        }
        print("전체 \(count)장의 카드를 섞었습니다.")
    }
    
    mutating func removeOne() -> Card? {
        return count != 0 ? cards.remove(at: Int.random(in: 0..<count)) : nil
    }
}
