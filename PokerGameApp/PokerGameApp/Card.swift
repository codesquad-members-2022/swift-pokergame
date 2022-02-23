//
//  Card.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/23.
//

import Foundation

class Card {
    let num: Int
    let shape: Shape // Card에서만 사용할 가능성이 높으므로, Nested enum타입으로 표현
    
    enum Shape {
        case spade
        case heart
        case diamond
        case clover
    }
    
    init(_ num: Int, _ shape: Shape){
        if num < 1 || 13 < num {
            self.num = 1
        } else {
            self.num = num
        }
        self.shape = shape
    }
}

// let c = Card(1, Card.Shape.clover)
