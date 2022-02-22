//
//  Card.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/22.
//

import Foundation

// 하나의 카드가 가지게 될 Card 인스턴스는 항상 고유한 값이 되어야 하므로 class로 설계
class Card{
    private let number: CardNumber
    private let shape: Shape
    
    func cardInformation() -> String{
        let cardValue = shape.rawValue + number.changedNumber
        return cardValue
    }
    
    init(number: CardNumber, shape: Shape){
        self.number = number
        self.shape = shape
    }
}


