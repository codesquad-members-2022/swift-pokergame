//
//  Card.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/23.
//

import Foundation

class Card {
    let num: CardNum
    let shape: CardShape // Card에서만 사용할 가능성이 높으므로, Nested enum타입으로

    enum CardShape: Int, CaseIterable {
        case spade = 1
        case clover
        case diamond
        case heart
    }
    
    enum CardNum: Int, CaseIterable {
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
    
    init(_ num: CardNum, _ shape: CardShape){
        self.num = num
        self.shape = shape
    }
    
}

extension Card: CustomStringConvertible {
    var description: String {
        var info: String = ""
        switch shape {
        case CardShape.spade:
            info.append("♠")
        case CardShape.clover:
            info.append("♣︎")
        case CardShape.diamond:
            info.append("♦︎")
        case CardShape.heart:
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
