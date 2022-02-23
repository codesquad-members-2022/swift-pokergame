//
//  Card+Extension.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/23.
//

import Foundation

// [수정] 따로 read라는 클래스의 Computed Property가 있었지만, CustomStringConvertible을 이용해 보았습니다.
extension Card: CustomStringConvertible {
    public var description: String {
        "\(info.symbol.rawValue)\(info.number.encodedNum)"
    }
}

// Symbol은 카드의 공통된 요소이기 때문에 타입으로 생성하는 것이 관리가 쉬울 것 같다고 판단하였습니다.
// [수정] CardSymbol을 없애고 Card 클래스의 nested 타입으로 재정의 하였습니다.
// [수정] 특정 클래스에 종속된 Enum 은 Nested Type 으로 정의하도록 버릇을 들여야 할 것 같습니다. 다른 종류의 카드가 추가될 가능성도 있기 때문입니다.
extension Card {
    enum Symbol: String, CaseIterable {
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"

        static var randomElement: Symbol {
            allCases.randomElement()!
        }
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.info == rhs.info
    }
}

// 해당 extension은 Int를 CardNumber로 바꾸기 쉽도록 만들거나
// CardNumber를 실제 카드에 인쇄되는 문자로 바꾸어줍니다.
extension Card.Number {
    
    static var allRange: ClosedRange<Card.Number> {
        (1...13) as ClosedRange<Card.Number>
    }
    
    static var random: Card.Number {
        allRange.randomElement()!
    }
    
    var encodedNum: String {
        encode()
    }
    
    public var description: String {
        encode()
    }
    
    private func encode() -> String {
        switch self {
        case 1: return "A"
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return String(self)
        }
    }
}
