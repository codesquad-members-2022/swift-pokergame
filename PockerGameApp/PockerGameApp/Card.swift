//
//  Card.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/01.
//

import Foundation

class Card {
    
    // 다른 객체로 인한 간섭이 있으면 안될 것 같아 let으로 선언하였습니다.
    let suitShape: Suit.Shape
    let suitCardNumber: Suit.SuitNumber
    let suitSpecialCard: Suit.SuitNumber.SpecialCard
    
    init(suitShape: Suit.Shape, suitCardNumber: Suit.SuitNumber, suitSpecialCard: Suit.SuitNumber.SpecialCard) {
        self.suitShape = suitShape
        self.suitCardNumber = suitCardNumber
        self.suitSpecialCard = suitSpecialCard
    }
    
}

