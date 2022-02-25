//
//  Card.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/24.
//

import Foundation

class Card: CustomStringConvertible {
    let shape: Shape, rank: Rank
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    //MARK: Nested enum을 사용한 이유
    // Card 클래스 외부에서 열거형을 안 사용할 듯 합니다.
    enum Shape: Character {
        case spade = "♤"
        case heart = "♡"
        case diamond = "◇"
        case club = "♧"
    }
    // Rank case를 나눈 이유는 타이핑의 경제성 때문에 나눴습니다.
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case ace = 1, jack = 11, queen = 12, king = 13
    }
    
    //MARK: 실제 카드를 추상화해서 은유적으로 뒤집어 본다, 패를 뒤집어 본다는 느낌으로 함수명을 지었습니다.
    var description: String {
        switch rank {
        case .ace:
            return "\(shape.rawValue)A"
        case .jack:
            return "\(shape.rawValue)J"
        case .queen:
            return "\(shape.rawValue)Q"
        case .king:
            return "\(shape.rawValue)K"
        default:
            return "\(shape.rawValue)\(rank.rawValue)"
        }
    }
}
