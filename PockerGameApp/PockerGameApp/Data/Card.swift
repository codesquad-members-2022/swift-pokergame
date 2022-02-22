//
//  Card.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/22.
//

import Foundation

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


