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
        
        //shuffle하고난 전과 후가 동일한 경우도 존재하는데 이는 어떻게 처리?
        XCTAssertNotEqual(cardDeckBeforeShuffle, cardDeck, "Wrong Card Deck After Shuffle")
    }
    
    func testDraw() {
        let cardDeckCountBeforeDraw = cardDeck.count
        
        _ = cardDeck.draw()
        let cardDeckCountAfterDraw = cardDeck.count
        
        XCTAssertEqual(cardDeckCountBeforeDraw - 1, cardDeckCountAfterDraw, "Wrong Card Deck After Draw")
    }
    
    func testReset() {
        var cardDeckBeforeReset = CardDeck()
        cardDeckBeforeReset.shuffle() //testShuffle 과정이 중복됨
        XCTAssertNotEqual(cardDeckBeforeReset, cardDeck, "Wrong Card Deck Shffle")
        
        cardDeckBeforeReset.reset()
        XCTAssertEqual(cardDeckBeforeReset, cardDeck, "Wrong Card Deck Count After Reset")
    }
    
}
