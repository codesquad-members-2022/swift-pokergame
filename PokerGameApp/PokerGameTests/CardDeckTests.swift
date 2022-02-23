//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by 김상혁 on 2022/02/23.
//

import XCTest
@testable import PokerGame

class PokerGameTests: XCTestCase {
    private var cardDeck: CardDeck!
    
    override func setUp() {
        cardDeck = CardDeck()
        super.setUp()
    }
    
    override func tearDown() {
        cardDeck = nil
        super.tearDown()
    }

    
    func testCount() {
        let cardDeckCount = cardDeck.count
        XCTAssertEqual(cardDeckCount, 52, "Wrong Initial Card Deck Count")
    }
    
    func testShuffle() {
        let cardDeckBeforeShuffle = cardDeck
        cardDeck.shuffle()
        
        XCTAssertNotEqual(cardDeckBeforeShuffle, cardDeck, "Wrong Card Deck After Shuffle")
    }
    
    func testDraw() {
        let cardDeckCountBeforeDraw = cardDeck.count
        
        _ = cardDeck.draw()
        let cardDeckCountAfterDraw = cardDeck.count
        
        XCTAssertEqual(cardDeckCountBeforeDraw - 1, cardDeckCountAfterDraw, "Wrong Card Deck After Draw")
    }
    
    func testReset() {
        let originalCardDeck = cardDeck
        cardDeck.shuffle()
        XCTAssertNotEqual(originalCardDeck, cardDeck, "Wrong Card Deck After Shuffle")
        
        cardDeck.reset()
        XCTAssertEqual(originalCardDeck, cardDeck, "Wrong Card Deck After Reset")
    }
}
