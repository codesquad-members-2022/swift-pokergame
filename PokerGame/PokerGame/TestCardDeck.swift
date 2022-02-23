//
//  TestCardDeck.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/23.
//

import Foundation

class TestCasdDeck {
    var cardDeck = CardDeck()
    
    func testCount() {
        print("> 카드 초기화")
        cardDeck.reset()
        print("카드 전체를 초기화했습니다.\n총 \(cardDeck.count())장의 카드가 있습니다.\n")
    }
    
    func testShuffle() {
        print("> 카드 섞기")
        cardDeck.shuffle()
        print("전체 \(cardDeck.count())장의 카드를 섞었습니다.\n")
    }
    
    func testRemoveOne() {
        print("> 카드 하나 뽑기")
        print("\(cardDeck.removeOne())")
        print("총 \(cardDeck.count())장의 카드가 남아있습니다.\n")
    }
}
