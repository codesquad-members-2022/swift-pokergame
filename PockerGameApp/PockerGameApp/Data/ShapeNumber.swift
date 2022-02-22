//
//  ShapeNumber.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/22.
//

import Foundation

// 변경해줘야 하는 값의 종류가 다소 많은 편이며, 카드의 값을 오로지 숫자로만 사용하는 놀이 등도 존재하므로 숫자와 문자열 모두 보관할 수 있는 형태를 생각함. 고유한 값으로 존재하거나 꼭 참조될 필요가 없으므로 Struct로 표현
struct CardNumber{
    private let number: Int
    var changedNumber: String{
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
        number = num
    }
}

// 4가지 문양밖에 없는 간단한 변환 처리이므로 enum으로 간소하게 표현
enum Shape: String{
    case heart = "♥️"
    case dia = "♦️"
    case spade = "♠️"
    case clover = "♣️"
}
