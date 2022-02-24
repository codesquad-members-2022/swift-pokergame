//
//  Card.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/21.
//

import Foundation

class Card {
    
    let suit: Suit
    let rank: Rank
    
    // 입력받은 타입에 맞는 유니코드를 출력하기 위해 열거형 사용
    enum Suit: String, CaseIterable, CustomStringConvertible {
       
        case spade = "\u{2660}", heart = "\u{1F5A4}", diamond = "\u{25C6}", clover = "\u{1F340}"
        
        var description: String {
            return self.rawValue
        }

    }
    enum Rank: Int, CaseIterable, CustomStringConvertible {
    
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        var description: String {
            switch self {
            case .one:
                return "A"
            case .eleven:
                return "J"
            case .twelve:
                return "Q"
            case .thirteen:
                return "K"
            default:
                return String(describing: self.rawValue)
            }
        }
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit.description)\(rank.description)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.rank == rhs.rank
    }
}
