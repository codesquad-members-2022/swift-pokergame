//
//  Card.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class CardModel {
    let type: CardType
    let number: Int
    
    init(type: CardType, number: Int) {
        self.type = type
        self.number = number
    }
}

extension CardModel {
    enum CardType {
        case spade, diamond, heart, clover
    }
}
