//
//  CardDeckTest.swift
//  CardDeckTest
//
//  Created by dale on 2022/02/23.
//

import XCTest
@testable import PokerGameApp

class CardDeckTest: XCTestCase {
    func testCountCardDeck() {
        let cardDeck = CardDeck()
        let cardDeckCount = cardDeck.count
        XCTAssertEqual(cardDeckCount, 52, "값이 일치하지 않습니다.")
    }
    
    func testShuffleCardDeck() {
        let cardDeck1 = CardDeck()
        let cardDeck2 = CardDeck()
        cardDeck2.shuffle()
        XCTAssertNotEqual(cardDeck1, cardDeck2, "일치하지 않습니다.")
    }
    
    func testRemoveOneCardDeck() {
        let cardDeck = CardDeck()
        cardDeck.removeOne()
        
        XCTAssertEqual(cardDeck.count, 51, "한장이 제거되지 않았습니다.")
    }
    
    func testResetCardDeck() {
        let originCardDeck = CardDeck()
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        XCTAssertNotEqual(originCardDeck, cardDeck, "카드가 섞이지 않았습니다.")
        cardDeck.reset()
        XCTAssertEqual(originCardDeck, cardDeck, "카드가 복구되지 않았습니다.")
    }
}
