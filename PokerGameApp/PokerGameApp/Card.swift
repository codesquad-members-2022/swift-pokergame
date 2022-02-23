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
    let number: Number
    
    static func all() -> [Card] {
        let allSuit = Suit.allCases
        let allNumber = Number.allCases
        var cards = [Card]()
        for suit in allSuit {
            for number in allNumber {
                let newCard = Card(suit: suit, number: number)
                cards.append(newCard)
            }
        }
        return cards
    }
    
    enum Suit: String, CustomStringConvertible, CaseIterable {
        case spade = "♠️"
        case heart = "♥️"
        case diamond = "♦️"
        case club = "♣️"
        
        var description: String {
            return self.rawValue
        }
    }
    
    enum Number: Int, CustomStringConvertible, CaseIterable {
        case ace = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case jack = 11
        case queen = 12
        case king = 13
        
        var description: String {
            switch self.rawValue {
            case 1:
                return "A"
            case 2...10:
                return "\(self.rawValue)"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return ""
            }
        }
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.suit)" + "\(self.number)"
    }
}

extension Card: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return (lhs.suit == rhs.suit) && (lhs.number == rhs.number)
    }
}
