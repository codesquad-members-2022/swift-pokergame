//
//  Card.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/22.
//

import Foundation

struct Card {
    let shape: Shape
    let number: Number
    
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
    
    var description: String {
        return "\(shape.description)\(number.description)"
    }
    
    
    // 카드 모양은 4종류이기 때문이 아래와 같이 선언했습니다.
    // rawValue의 자료형을 String으로 선언하면 rawValue에 원시값을 일일히 저장하지 않아도 case 이름과 동일한 문자열이 rawValue로 생성되기 때문에 아래와 같이 선언했습니다.
    // 그러다가 각 카드 모양을 나타내줘야겠다는 생각에 rawValue를 직접 지정하게 되었고, rawValue에는 하나의 문자만 저장하면 되므로 String이 아닌 Character형으로 rawValue 타입을 변경했습니다.
    enum Shape: Character {
        case spade = "♠"
        case diamond = "◆"
        case heart = "♥"
        case club = "♣"
        
        var description: String {
            return String(rawValue)
        }
    }


    // 숫자는 1 - 13개 중에 하나를 가질 수 있어서 처음에는 Int형으로 저장해야하나 고민했습니다.
    // 하지만 enum의 case 이름을 숫자로 선언할 수 없기 때문에 영어로 선언하고, rawValue를 String 타입으로 선언하고, 숫자 1, 11, 12, 13은 다른 rawValue를 가지도록 했습니다.
    enum Number: String {
        case one = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "J"
        case twelve = "Q"
        case thirteen = "K"
        
        var description: String {
            return rawValue
        }
    }
}
