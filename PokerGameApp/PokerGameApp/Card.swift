//
//  Card.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/22.
//

import Foundation


/**
 step2 에서는 상속을 통한 다형성의 필요를 느끼지 못하여 Class 대신 Struct 로 구현.
- suit(모양): 4개로 한정되어 있으므로 Nested Enum 으로 구현
 - number: 인스턴스 생성의 편의를 위해 초기화할때 숫자값으로 받음. 화면에 출력할때 변환하여 출력.
 */
struct Card {
    let suit: Suit
    let number: Int
    
    enum Suit: String {
        case spade = "♠️"
        case heart = "♥️"
        case diamond = "♦️"
        case club = "♣️"
    }
    
    private func numberToString() -> String {
        switch self.number {
        case 1:
            return "A"
        case 2...10:
            return String(number)
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            fatalError("Card:: Fail numberToString()")
        }
    }
    
    func convertedString() -> String {
        return self.suit.rawValue + self.numberToString()
    }
}
