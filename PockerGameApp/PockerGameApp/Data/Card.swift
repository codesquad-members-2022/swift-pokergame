//
//  Card.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/22.
//

import Foundation

// 하나의 카드가 가지게 될 Card 인스턴스는 항상 고유한 값이 되어야 하므로 class로 설계
class Card: CustomStringConvertible{
    private let number: Card.CardNumber
    private let shape: Card.Shape
    
    var description: String{
        let cardValue = shape.description + number.description
        return cardValue
    }
    
    // 랜덤 문양, 숫자의 카드 인스턴스 초기화
    init(number: Card.CardNumber, shape: Card.Shape){
        self.number = number
        self.shape = shape
    }
    
    
    // 한정된 범위에 맞춰 enum 타입으로 수정
    enum CardNumber: CustomStringConvertible{
        case one, eleven, twelve, thirteen, others(Int)
        var description: String{
            switch self {
            case .one:
                return "A"
            case .eleven:
                return "J"
            case .twelve:
                return "Q"
            case .thirteen:
                return "K"
            case .others(let int):
                return "\(int)"
            }
        }
    }

    // 4가지 문양밖에 없는 간단한 변환 처리이므로 enum으로 간소하게 표현
    enum Shape: CaseIterable, CustomStringConvertible{
        case heart, dia, spade, clover
        var description: String{
            switch self {
            case .heart:
                return "♥️"
            case .dia:
                return "♦️"
            case .spade:
                return "♠️"
            case .clover:
                return "♣️"
            }
        }
    }
}


