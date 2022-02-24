//
//  Card.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22 19:00 시작.
//

import Foundation

class Card {
    
    typealias Number = Int
    
    private(set) var info: CardInfo

    init(using info: CardInfo) {
        self.info = info
    }
}

