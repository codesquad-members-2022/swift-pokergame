//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by Selina on 2022/02/24.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    var sut: CardDeck!
    var sut2: PokerGame!
    
    func testCardIsInitialized() {
        XCTAssertEqual(sut.count, 52, "Card is Not Initialized")
    }
    
    func testCardIsShuffled() {
        let initialCardDeck = sut
        sut.shuffle()
        XCTAssertNotEqual(initialCardDeck, sut, "Card is Not Shuffled")
    }
    
    func testCardIsRemoved() {
        let cardCount = sut.count
        sut.removeOne()
        XCTAssertNotEqual(cardCount, sut.count, "Card is Not Removed")
    }
    
    func testCardIsReset() {
        testCardIsShuffled()
        testCardIsRemoved()
        sut.reset()
        XCTAssertEqual(sut.count, 52)
    }
    
    func testCardGameIsStarted() {
        sut2.run()
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CardDeck()
        sut2 = PokerGame()
    }

    override func tearDownWithError() throws {
        sut = nil
        sut2 = nil
        try super.tearDownWithError()
    }
}
