//
//  Card.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/21.
//

import Foundation

// Named type을 선언할 때, Stack을 사용하기 때문에 빠르고 불변성을 가진 Struct를 먼저 고려했습니다.
// Class를 꼭 써야할 이유가 없으면 Struct를 쓰라고 배웠습니다.
// Card 객체는 고유성이 필요한 객체가 아니고 (하트 6는 모두 똑같은 하트 6임)
// 꼭 변경 가능한 상태를 공유해야 하는 상황도 아니기 때문에 Struct를 선택했습니다.

struct Card: CustomStringConvertible {
    let suit: CardSuit
    let number: CardNumber
    
    var description: String {
        return "\(suit.description)\(number.description)"
    }
}

// Spades와 ♠️이 매치된다거나, jack과 "J"가 매치된다는 정보는
// Card 객체보다, CardSuit & CardNumber 객체와 관련성이 더 높다고 판단해 해당 객체에 추가했습니다.
// Enum과 CustomStringCovertible를 사용했습니다.

enum CardSuit: CustomStringConvertible {
    case spades
    case clubs
    case hearts
    case diamonds
    
    var description: String {
        switch self {
        case .spades: return "♠️"
        case .clubs: return "♣️"
        case .hearts: return "♥️"
        case .diamonds: return "♦️"
        }
    }
}

// 처음에는 CardNumver를 Int로 선언하려고 했습니다.
// 하지만 유효 범위의 지정과 Description 설정을 위해 Enum 타입으로 선언했습니다.
// YAGNI일 수도 있지만, 카드게임이라면 숫자값을 쓸 일이 분명 있을 거라고 생각했습니다.
// 하지만 Enum의 case명에는 숫자를 쓸 수 없습니다.
// 각 CardNumber가 가지는 숫자값은 RawValue(Int)로 담아주었습니다.
// 이후 RawValue로 enum을 생성하거나, 게임 로직에서 rawValue를 호출하여 사용할 수 있을 거 같습니다.

enum CardNumber: Int, CustomStringConvertible {
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
        switch self {
        case .ace: return "A"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .ten: return "10"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        }
    }
}
