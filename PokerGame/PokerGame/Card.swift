//
//  Card.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/21.
//

import Foundation

internal class Card {
    
    let shape: Shape
    let number: Number
    
    // 입력받은 타입에 맞는 유니코드를 출력하기 위해 열거형 사용
    enum Shape: String {
        case spade = "\u{2660}", heart = "\u{1F5A4}", diamond = "\u{25C6}", clover = "\u{1F340}"
    }
    enum Number: Int {
        case one = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7,
             eight = 8, nine = 9, ten = 10, eleven = 11, twelve = 12, thirteen = 13
    }
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }

}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape.rawValue)\(numberConvert())"
    }
    
    private func numberConvert() -> String {
        switch number {
        case .one:
            return "A"
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        default:
            return "\(self.number.rawValue)"
        }

    }
}
