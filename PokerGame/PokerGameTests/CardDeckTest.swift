//
//  CardDeckTest.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/03/02.
//

import XCTest
@testable import PokerGame

class CardDeckTest: XCTestCase {
    
    func testCount() {
        let cardDeck = CardDeck()
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
        let cardDeck = CardDeck()
        
        XCTAssertEqual(cardDeck.count(), 52)
    }
    
    func testRemoveOne() {
        let cardDeck = CardDeck()
        
        cardDeck.removeOne()
        let result = 1...51 ~= cardDeck.count()
        XCTAssertTrue(result)
    }
}
