//
//  PokerGameTests.swift
//  PokerGameAppTests
//
//  Created by Bumgeun Song on 2022/02/23.
//

import XCTest
@testable import PokerGameApp

class PokerGameTests: XCTestCase {
    
    func testExample() throws {
        XCTAssertEqual(1+1, 2)
    }
    
    func testDealerDeal() {
        let testNames = Player.getRandomPlayerNames(pick: 5)
        let testPlayers = testNames.map { name in Player(name: name) }
        let testNumber = 5
        let dealer = Dealer(deck: CardDeck(), players: testPlayers)
        
        try? dealer.deal(numOfcards: testNumber)
    }
    
    func testWithTooManyCards() {
        let testNames = Player.getRandomPlayerNames(pick: 5)
        let testPlayers = testNames.map { name in Player(name: name) }
        let tooManyNumber = 10
        let dealer = Dealer(deck: CardDeck(), players: testPlayers)
        
        
        var thrownError: Error!
        XCTAssertThrowsError(try dealer.deal(numOfcards: tooManyNumber)) {
            thrownError = $0
        }
        XCTAssertTrue(thrownError as? PokerGameError == .outOfCards)
    }
    
    func testSevenStudGame() throws {
        let pokerGame = try PokerGame(type: .sevenStud, numberOfPlayers: 3)
        
        try pokerGame.start()
    }
    
    func testFiveStudGame() throws {
        let pokerGame = try PokerGame(type: .fiveStud, numberOfPlayers: 4)
        
        try pokerGame.start()
    }
    
    
    func testWithTooManyPlayer() throws {
        var thrownError: Error!
        XCTAssertThrowsError(try PokerGame(type: .sevenStud, numberOfPlayers: 8)) {
            thrownError = $0
        }
        XCTAssertTrue(thrownError as? PokerGameError == .tooManyPlayer)
    }
    
}
