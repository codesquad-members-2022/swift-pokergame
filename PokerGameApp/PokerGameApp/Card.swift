//
//  Card.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/22.
//

import Foundation

struct Card {
    // 카드에는 4개의 모양, 13개의 숫자가 정해져 있어 enum 타입으로 정의
    enum CardShape : String {
        case heart = "❤️"
        case spade = "♠️"
        case clover = "♣️"
        case diamond = "♦️"
    }
    enum CardNumber : String {
        case A
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case J
        case Q
        case K
    }
    let shape : CardShape
    let number : CardNumber
    init(shape : CardShape, number: CardNumber) {
        self.shape = shape
        self.number = number
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape.rawValue)\(number.rawValue)"
    }
}
