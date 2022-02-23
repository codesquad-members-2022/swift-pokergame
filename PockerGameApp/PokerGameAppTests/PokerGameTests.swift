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
    
    func testWithTooManyCards() {
        let testPlayers = (0..<5).map { _ in Player() }
        let tooManyNumber = 10
        let dealer = Dealer(deck: CardDeck(), players: testPlayers)
        
        
        var thrownError: Error!
        XCTAssertThrowsError(try dealer.deal(numOfcards: tooManyNumber)) {
            thrownError = $0
        }
        XCTAssertTrue(thrownError as? PokerGameError == .outOfCards)
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
