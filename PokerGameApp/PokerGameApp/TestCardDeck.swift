//
//  TestCardDeck.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/23.
//

import Foundation

class TestCardDeck {
    private let cardDeck: CardDeck!
    
    init() {
        self.cardDeck = CardDeck()
    }
    
    func count() {
        let count = cardDeck.count()
        
        if count != 52 {
            print("TestCardDeck::Count() Fail-초기화했을때 카드 갯수가 예상값(52)가 아닙니다")
            return
        }
        print("TestCardDeck::Count() Success")
    }
}
