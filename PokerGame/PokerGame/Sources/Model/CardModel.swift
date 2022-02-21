//
//  Card.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class CardModel {
    let pattern: CardPattern
    let number: Int
    
    init?(pattern: CardPattern, number: Int) {
        guard number > 0 && number <= 13 else {
            return nil
        }
        self.pattern = pattern
        self.number = number
    }
}

extension CardModel {
    enum CardPattern: String {
        case spade, diamond, heart, clover
    }
}
