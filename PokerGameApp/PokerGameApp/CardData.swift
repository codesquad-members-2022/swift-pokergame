//
//  CardData.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/22.
//

import Foundation

//카드의 값을 표현하는 열거형
enum CardData {
    //카드의 값 중 모양을 표현하는 열거형
    enum FaceData: String {
        case spade
        case club
        case heart
        case diamond
    }

    //카드의 값 중 숫자를 표현하는 열거형
    enum NumericData: Int {
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
    }
}

//CustomStringConvertible을 채택하고 description 프로퍼티를 구현해서
//다른 객체가 해당 열거형의 rawValue에 직접 접근하는 것을 막고,
//각 열거형의 case마다 어떤 String값을 반환할지 지정해줄 수 있습니다.
extension CardData.FaceData: CustomStringConvertible {
    var description: String {
        switch self {
        case .spade:
            return "♠"
        case .club:
            return "♣"
        case .heart:
            return "♥"
        case .diamond:
            return "♦"
        }
    }
}

extension CardData.NumericData: CustomStringConvertible {
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            return "\(self.rawValue)"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
}
