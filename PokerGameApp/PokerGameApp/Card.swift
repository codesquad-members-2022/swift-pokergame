//
//  Card.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22 19:00 시작.
//

import Foundation

class Card {
    
    private(set) var info: CardInfo
    
    var read: String {
        "\(info.symbol.rawValue)\(info.number.encodedNum)"
    }
    
    init(using info: CardInfo) {
        self.info = info
    }
    
    func isMatching(with card: Card) -> Bool {
        return self.info == card.info
    }
    
    func isMatching(with cardInfo: CardInfo) -> Bool {
        return self.info == cardInfo
    }
    
}

