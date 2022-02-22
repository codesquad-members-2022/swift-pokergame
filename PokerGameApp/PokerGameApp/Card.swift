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
