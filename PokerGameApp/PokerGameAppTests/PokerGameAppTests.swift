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
    
    func testCardIsInitialized() {
        XCTAssertEqual(sut.count, 52, "Card is Not Initialized")
    }
    
    func testCardIsShuffled() {
        let initialCardDeck = sut
        sut.shuffle()
        XCTAssertNotEqual(initialCardDeck, sut, "Card is Not Shuffled")
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CardDeck()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}
