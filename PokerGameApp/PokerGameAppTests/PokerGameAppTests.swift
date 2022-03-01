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
    
    func testPokerGameFiveStud() {
        let participantCount = [2, 3, 4, 5]
        
        for participant in participantCount {
            sut2 = PokerGame()
            sut2.cardStud = 5
            sut2.playersCount = participant - 1
            
            let availableTurnCount = (52 / sut2.cardStud) / participant // 총 가능한 턴 수
            let expectedRemainCardCount = 52 - (sut2.cardStud * participant * availableTurnCount)
            let remainCardCount = sut2.run()
            
            XCTAssertEqual(expectedRemainCardCount, remainCardCount)
            sut2 = nil
        }
    }
    
    func testPokerGameSevenStud() {
        let participantCount = [2, 3, 4, 5]
        
        for participant in participantCount {
            sut2 = PokerGame()
            sut2.cardStud = 7
            sut2.playersCount = participant - 1
            
            let availableTurnCount = (52 / sut2.cardStud) / participant // 총 가능한 턴 수
            let expectedRemainCardCount = 52 - (sut2.cardStud * participant * availableTurnCount)
            let remainCardCount = sut2.run()
            
            XCTAssertEqual(expectedRemainCardCount, remainCardCount)
            sut2 = nil
        }
    }
    
    func testPlayerNameIsInitialized() {
        let randomValue = Int.random(in: 1...4)
        let randomNames = sut2.makeRandomName(count: randomValue)
        XCTAssertEqual(randomNames.count, randomValue)
    }
}
