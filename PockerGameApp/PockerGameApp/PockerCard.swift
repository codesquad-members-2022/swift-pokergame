//
//  Card.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/21.
//

import Foundation

struct PockerCard{ // class를 상속받지 않기에 메모리 효율이 좋은 struct를 사용하였습니다.
    enum Shape: Character, CaseIterable{ // 이를 채택하는 곳은 PockerCard 외에 없기에 중첩된 타입을 사용하였습니다.
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }
    let shape: Shape
    let number: Int
    
    init(shape: Shape, number: Int){
        self.shape = shape
        self.number = number
    }
    
    private func numberToString() -> String{ // 1,11,12,13 은 숫자가 아닌 String값으로 표현해야 하기에 이를 변환하는 함수를 구현하였습니다.
        switch number{
        case 1: return "A"
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default:
            return String(number)
        }
    }
}
extension PockerCard: CustomStringConvertible { // 출력 시 카드형태의 String으로 보여주기 위한 변수설정입니다.
    var description: String {
        return "\(shape.rawValue)\(numberToString())"
    }
}
