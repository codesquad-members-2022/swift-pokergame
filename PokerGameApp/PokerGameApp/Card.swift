//
//  Card.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/22.
//

import Foundation
struct CardDeck {
    private let originCards : [Card]
    private var cards : [Card]
    var count : Int {
        return cards.count
    }
    init() {
        var tempCardArr : [Card] = []
        for i in Card.Shape.allCases {
            for j in Card.Number.allCases{
                tempCardArr.append(Card(shape: i, number: j))
            }
        }
        originCards = tempCardArr
        cards = originCards
    }
    mutating func removeOne() -> Card? {
        return self.cards.popLast()
    }
    mutating func reset() {
        cards = originCards
    }
}
struct Card {
    // 카드에는 4개의 모양, 13개의 숫자가 정해져 있어 enum 타입으로 정의
    enum Shape : String, CustomStringConvertible, CaseIterable {
        var description: String {
            return rawValue
        }
        case heart = "❤️"
        case spade = "♠️"
        case clover = "♣️"
        case diamond = "♦️"
    }
    enum Number : String, CustomStringConvertible, CaseIterable {
        var description: String {
            return rawValue
        }
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
    let shape : Shape
    let number : Number
    init(shape : Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape)\(number)"
    }
}
