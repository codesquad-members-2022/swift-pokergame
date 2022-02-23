//
//  Card.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/21.
//

import Foundation

struct PockerCard{ // class를 상속받지 않기에 메모리 효율이 좋은 struct를 사용하였습니다.
    enum Shape: Character, CaseIterable, CustomStringConvertible{ // 이를 채택하는 곳은 PockerCard 외에 없기에 중첩된 타입을 사용하였습니다.
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
        var description: String{
            switch self{
            case .spades: return "♠️"
            case .hearts: return "♥️"
            case .diamonds: return "♦️"
            case .clubs: return "♣️"
            }
        }
    }
    
    enum Number: Int, CaseIterable, CustomStringConvertible{
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        var description: String{
            switch self{
            case .ace: return "ace"
            case .jack: return "jack"
            case .queen: return "queen"
            case .king: return "king"
            default: return "\(self.rawValue)"
            }
        }
    }
    
    let shape: Shape
    let number: Number
    
    init(shape: Shape, number: Number){ // 14이상의 숫자가 입력되는 것을 방지하기 위해 number의 타입을 enum으로 변경하였습니다.
        self.shape = shape
        self.number = number
    }
}
