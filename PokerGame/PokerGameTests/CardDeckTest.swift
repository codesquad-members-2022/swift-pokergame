//
//  CardDeckTest.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/03/02.
//

import XCTest
@testable import PokerGame

class CardDeckTest: XCTestCase {

    private var cardDeck = CardDeck()
    
    func testCount() {
        let result = 1...52 ~= cardDeck.count()
        XCTAssertTrue(result)
    }
    
    func testShuffle() {
        let originalCardDeck = CardDeck()
        let resultCardDeck = CardDeck()
        
        resultCardDeck.shuffle()
        
        XCTAssertNotEqual(originalCardDeck, resultCardDeck)
    }
    
    func testReset() {
        XCTAssertEqual(cardDeck.count(), 52)
    }
    
    func testRemoveOne() {
        cardDeck.removeOne()
        let result = 1...51 ~= cardDeck.count()
        XCTAssertTrue(result)
    }
}
