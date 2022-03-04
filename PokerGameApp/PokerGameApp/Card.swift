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

    enum Shape: Int {
        case spade = 1
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
        var str: String
        switch n {
        case 1:
            str = "A"
        case 11:
            str = "J"
        case 12:
            str = "Q"
        case 13:
            str = "K"
        default:
            str = String("\(n)")
        }
        info.append(str)
        
        return info
    }
}
