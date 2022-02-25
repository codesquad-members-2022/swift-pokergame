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
    
    func testPlayerNameIsInitialized() {
        let randomValue = Int.random(in: 1...4)
        let randomNames = sut2.makeRandomName(count: randomValue)
        XCTAssertEqual(randomNames.count, randomValue)
    }
    
    func testDealerIsInitialized() {
        sut2.run()
        XCTAssertNotNil(sut2.dealer)
    }
    
    func testCardIsDistributedToDealer() {
        sut2.run()
        let cardStud = PokerGame.cardStud
        XCTAssertEqual(sut2.dealer?.cards.count, cardStud)
    }
    
    func testCardIsDistributedToPlayer() {
        sut2.run()
        let cardStud = PokerGame.cardStud
        for index in 0..<sut2.players.count {
            XCTAssertEqual(sut2.players[index].cards.count, cardStud)
        }
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
