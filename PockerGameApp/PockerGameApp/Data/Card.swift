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
    init(){
        guard let shapeRandomNum = Shape.allCases.randomElement() else{
            print("적절한 Case 값을 찾지 못하였습니다.")
            fatalError()
        }
        
        let cardRandomNum = Int.random(in: 1...13)
        
        self.number = CardNumber(num: cardRandomNum)
        self.shape = shapeRandomNum
    }
    
    // 변경해줘야 하는 값의 종류가 다소 많은 편이며, 카드의 값을 오로지 숫자로만 사용하는 놀이 등도 존재하므로 숫자와 문자열 모두 보관할 수 있는 형태를 생각함. 고유한 값으로 존재하거나 꼭 참조될 필요가 없으므로 Struct로 표현
    struct CardNumber: CustomStringConvertible{
        private let number: Int
        var description: String{
            switch number{
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return number.description
            }
        }
        
        init(num: Int){
            guard num <= 13 || num != 0 else{
                print("적절하지 못한 값이 발견되었습니다 : \(num)")
                fatalError()
            }
            
            number = num
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


