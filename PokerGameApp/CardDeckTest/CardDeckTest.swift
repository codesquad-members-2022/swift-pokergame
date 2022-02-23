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
        XCTAssertEqual(cardDeckCount, 52, "값이 일치합니다.")
    }
}
