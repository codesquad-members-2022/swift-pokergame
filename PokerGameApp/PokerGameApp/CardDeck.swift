//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/23.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    
    init() {
        var cards = [Card]()
        
        for shape in Card.Shape.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(shape: shape, number: number))
            }
        }
        
        self.cards = cards
        print("카드 전체를 초기화했습니다.")
    }
}
