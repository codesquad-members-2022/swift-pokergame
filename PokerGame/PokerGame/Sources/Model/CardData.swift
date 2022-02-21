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
struct CardData {
    let pattern: CardPattern
    let number: Int
        
    func numberToString() -> String {
        switch number {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(number)
        }
    }
}

extension CardData: CustomStringConvertible {
    var description: String {
        "\(pattern.rawValue)\(numberToString())"
    }
}

extension CardData {
    enum CardPattern: String, CaseIterable {
        case spade = "♠"
        case diamond = "♦"
        case heart = "♥"
        case clover = "♣"
    }
}
