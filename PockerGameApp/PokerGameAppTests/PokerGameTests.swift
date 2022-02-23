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
        let testPlayers = (0..<5).map { _ in Player() }
        let testNumber = 5
        let dealer = Dealer(deck: CardDeck(), players: testPlayers)
        
        try? dealer.deal(numOfcards: testNumber)
        
        for players in testPlayers {
            XCTAssertEqual(players.cards.count, testNumber)
        }
    }
    
    func testPlayerReceive() throws {
        let john = Player(name: "John")
        
        XCTAssertEqual(john.cards, [])
        
        let randomCards = (1...7).map {
            Card(suit: .hearts, number: CardNumber(rawValue: $0)!)
        }
        john.receive(cards: randomCards)
        
        XCTAssertEqual(john.cards, randomCards)
    }
    
    func testSevenStudGame() throws {
        let pokerGame = PokerGame(type: .sevenStud, numberOfPlayers: 5)
        
        try pokerGame.start()
    }
    
    func testFiveStudGame() throws {
        let pokerGame = PokerGame(type: .fiveStud, numberOfPlayers: 5)
        
        try pokerGame.start()
    }
    
    
    func testWithTooManyPlayer() throws {
        let pokerGame = PokerGame(type: .sevenStud, numberOfPlayers: 8)
        
        var thrownError: Error!
        XCTAssertThrowsError(try pokerGame.start()) {
            thrownError = $0
        }
        XCTAssertTrue(thrownError as? PokerGameError == .tooManyPlayer)
    }
    
    
}
