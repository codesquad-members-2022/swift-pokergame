//
//  CardFactory.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

class CardFactory {
    
    enum Init {
        case random
        case deck
    }
    
    static func randomCard() -> Card {
        return Card(as: .random, using: .random)
    }
    
    static func deckOfCard() -> [Card] {
        var result = [Card]()
        for symbol in CardSymbol.allCases {
            let cards = CardNumber.allCases.compactMap({ number in Card(as: number, using: symbol) })
            result.append(contentsOf: cards)
        }
        
        return result
    }
}
