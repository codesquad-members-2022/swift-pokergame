//
//  Card.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

///카드정보를 담고 있는 구조체
/// struct 만든 이유는 카드데이터의 경우 패턴과 숫자의 값만 가지고 있고,
/// 이 값들은 외부에서 변환하거나, 수정이 이루어질 필요가 없는 데이터
/// 초기화 시 설정된 값만 사용한다
struct Card: CustomStringConvertible {
    let pattern: Pattern
    let number: Number
    
    var description: String {
        "\(pattern)\(number)"
    }
}

// MARK: - CardPattern

extension Card {
    enum Pattern: String, CaseIterable, CustomStringConvertible {
        case spade
        case diamond
        case heart
        case clover
        
        var description: String {
            switch self {
            case .clover:
                return "c"
            case .diamond:
                return "d"
            case .heart:
                return "h"
            case .spade:
                return "s"
            }
        }
    }
}

// MARK: - CardNumber

extension Card {
    enum Number: Int, CaseIterable, CustomStringConvertible {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return String(self.rawValue)
            }
        }
    }
}
