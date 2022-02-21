//
//  CardDeck.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class CardDeck {
    
    var deck: [CardData] = []
    
    init() {
        deck = CardData.CardPattern.allCases.flatMap { pattern in
            (1...13).map { number in
                CardData(pattern: pattern, number: number)
            }
        }
    }
}
