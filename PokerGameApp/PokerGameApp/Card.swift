//
//  Card.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/22.
//

import Foundation

class Card {
    var shape : CardShape
    var number : CardNumber
    var string : String {
        return "\(shape.rawValue)\(number.rawValue)"
    }
    init(shape : CardShape, number: CardNumber) {
        self.shape = shape
        self.number = number
    }
}

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
