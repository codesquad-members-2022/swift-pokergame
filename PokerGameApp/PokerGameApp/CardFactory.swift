//
//  CardFactory.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

class CardFactory {
    
    static func randomCard() -> Card {
        let info = CardInfo(as: Card.Symbol.randomElement, with: Card.Number.random)!
        return Card(using: info)
    }
    
    static func deckOfCard() -> [Card] {
        var result = [Card]()
        for symbol in Card.Symbol.allCases {
            let cards = Card.Number.allRange.compactMap({ cardNumber in Card(using: CardInfo(as: symbol, with: cardNumber)!) })
            result.append(contentsOf: cards)
        }
        
        return result
    }
}
