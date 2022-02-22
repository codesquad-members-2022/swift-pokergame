//
//  CardNumber+Extension.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation


// CardNumber는 정수로 표현하는 것이 루프 작업을 생각했을 때 효율적이라고 생각했습니다.
// 해당 타입으로 정의된 정수를 처리하는 여러 작업들을 타입 확장으로 해결하면 더 효율적이라고도 판단하였습니다.
typealias CardNumber = Int

// 해당 extension은 Int를 CardNumber로 바꾸기 쉽도록 만들거나
// CardNumber를 실제 카드에 인쇄되는 문자로 바꾸어줍니다.
extension CardNumber {
    
    static var random: CardNumber {
        Int.random(in: 1...13) as CardNumber
    }
    
    static var allRange: ClosedRange<CardNumber> {
        1...13 as ClosedRange<CardNumber>
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
