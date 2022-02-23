//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by Jihee hwang on 2022/02/23.
//

import XCTest

@testable import PokerGame

class PokerGameTests: XCTestCase {
    
    private var cardDeck = CardDeck()
    
    func testCount() {
        let result = 1...52 ~= cardDeck.count()
        XCTAssertTrue(result)
    }
    
    func testShuffle() {
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
