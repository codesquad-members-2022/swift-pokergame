//
//  CardFactory.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

/*
 목표 타입인 되는 Card 클래스는 정의된 카드를 만들 수 있도록 init 메소드를 제공하고
 랜덤한 정보를 가진 카드나, 한 덱의 카드 등 특별한 조건으로 카드를 생성하기 위해
 팩토리 디자인 패턴을 구현해 보았습니다.
 */
class CardFactory {
    
    // 각 타입의 랜덤 값을 가진 info로 Card를 만듭니다.
    static func randomCard() -> Card {
        let info = CardInfo(as: Card.Symbol.randomElement, with: Card.Number.random)!
        return Card(using: info)
    }
    
    // 총 52장의 서로 다른 카드를 만듭니다.
    static func deckOfCard() -> [Card] {
        var result = [Card]()
        for symbol in Card.Symbol.allCases {
            // 고차함수를 쓴 이유는 for in for loop가 가독성이 떨어진다고 생각하기 때문이었습니다.
            // ! 를 사용한 이유는 이미 정의된 CardNumber.allRange를 사용하고 있기 때문입니다.
            let cards = Card.Number.allRange.compactMap({ cardNumber in Card(using: CardInfo(as: symbol, with: cardNumber)!) })
            result.append(contentsOf: cards)
        }
        
        return result
    }
}
