//
//  Card.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/22.
//

import Foundation

struct Card {
    
}



// 카드 모양은 4종류이기 때문이 아래와 같이 선언했습니다.
// rawValue의 자료형을 String으로 선언하면 rawValue에 원시값을 일일히 저장하지 않아도 case 이름과 동일한 문자열이 rawValue로 생성되기 때문에 아래와 같이 선언했습니다.
enum CardShape: String {
    case spade
    case diamond
    case heart
    case club
}



// 숫자는 1 - 13개 중에 하나를 가질 수 있어서 처음에는 Int형으로 저장해야하나 고민했습니다.
// 하지만 enum의 case 이름을 숫자로 선언할 수 없기 때문에 영어로 선언하고, rawValue를 String 타입으로 선언하고, 숫자 1, 11, 12, 13은 다른 rawValue를 가지도록 했습니다.
enum CardNumber: String {
    case one = "A"
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven = "J"
    case twelve = "Q"
    case thirteen = "K"
}
