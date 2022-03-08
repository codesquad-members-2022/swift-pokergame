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

    enum CardShape: CaseIterable, CustomStringConvertible {
        var description: String {
            switch self {
            case CardShape.spade:
                return "♠"
            case CardShape.clover:
                return "♣︎"
            case CardShape.diamond:
                return "♦︎"
            case CardShape.heart:
                return "♥︎"
            }
        }
        case spade
        case clover
        case diamond
        case heart
    }
    
    enum CardNum: Int, CaseIterable, CustomStringConvertible {
        var description: String {
            switch self {
            case CardNum.one:
                return "A"
            case CardNum.eleven:
                return "J"
            case CardNum.twelve:
                return "Q"
            case CardNum.thirteen:
                return "K"
            default:
                return String(describing: self.rawValue)
            }
        }
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
        return "\(self.shape)\(self.num)"
    }
}
