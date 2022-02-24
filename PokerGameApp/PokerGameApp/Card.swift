//
//  Card.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/23.
//

import Foundation

class Card {
    let num: Num
    let shape: Shape // Card에서만 사용할 가능성이 높으므로, Nested enum타입으로

    // Shape를 원시 타입으로 만든 이유: 특수 문자를 입력받을 경우, 착오가 발생할 수 있기 때문
    enum Shape {
        case spade
        case clover
        case diamond
        case heart
    }
    
    enum Num: Int {
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case eleven
        case twelve
        case thirteen
    }
    
    init(_ num: Num, _ shape: Shape){
        self.num = num
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
        
        let n = num.rawValue
        var ch: Character
        switch n {
        case 1:
            ch = "A"
        case 11:
            ch = "J"
        case 12:
            ch = "Q"
        case 13:
            ch = "K"
        default:
            ch = Character("\(n)")
        }
        info.append(ch)
        
        return info
    }
}
