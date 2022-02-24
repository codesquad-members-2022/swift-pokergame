//
//  Card.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/23.
//

import Foundation

class Card {
    let num: Int
    let shape: Shape // Card에서만 사용할 가능성이 높으므로, Nested enum타입으로

    // Shape를 원시 타입으로 만든 이유: 특수 문자를 입력받을 경우, 착오가 발생할 수 있기 때문
    enum Shape {
        case spade
        case clover
        case diamond
        case heart
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

extension Card: CustomStringConvertible {
    var description: String {
        var info: String = ""
        switch shape {
        case Shape.spade:
            info.append("♠")
        case Shape.clover:
            info.append("♣︎")
        case Shape.diamond:
            info.append("♦︎")
        case Shape.heart:
            info.append("♥︎")
        }
        
        if num == 1 {
            info.append("1")
        } else if num == 11 {
            info.append("J")
        } else if num == 12 {
            info.append("Q")
        } else if num == 13 {
            info.append("K")
        } else {
            info.append("\(num)")
        }
        
        return info
    }
}
