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
        var cardDeck2 = CardDeck()
        cardDeck2.shuffle()
        XCTAssertNotEqual(cardDeck1, cardDeck2, "일치하지 않습니다.")
    }
}
