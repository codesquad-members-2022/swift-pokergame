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
    
    func testDeal() throws {
        let deck = CardDeck()
        let dealer = Dealer(deck: deck)
        let dealt = try? dealer.deal(numOfcards: 7)
        XCTAssertTrue(dealt?.count == 7)
    }
    
    func testDealFail() throws {
        let deck = CardDeck()
        let dealer = Dealer(deck: deck)
        for _ in 0..<7 {
            let _ = try dealer.deal(numOfcards: 7)
        }
        let dealtToFail = try dealer.deal(numOfcards: 7)
        XCTAssertFalse(dealtToFail.count == 7)
    }
    
    func testReceive() throws {
        let john = Player(name: "John")
        XCTAssertEqual(john.cards, [])
        
        let randomCards = (1...7).map {
            Card(suit: .hearts, number: CardNumber(rawValue: $0)!)
        }
        john.receive(cards: randomCards)
        XCTAssertEqual(john.cards, randomCards)
    }
    
    func testSevenStudGame() throws {
        let deck = CardDeck()
        let dealer = Dealer(deck: deck)
        
        let testPlayers = [
            Player(name: "Eddy"),
            Player(name: "Jason"),
            Player(name: "Chez"),
            Player(name: "Gucci"),
            Player(name: "Ebony")
        ]
        
        let pokerGame = PokerGame(type: .sevenStud, dealer: dealer, players: testPlayers)
        
        try? pokerGame.start()
        for player in pokerGame.allPlayers {
            XCTAssertEqual(player.cards.count, 7)
        }
    }
    
    func testFiveStudGame() throws {
        let deck = CardDeck()
        let dealer = Dealer(deck: deck)
        
        let testPlayers = [
            Player(name: "Eddy"),
            Player(name: "Jason"),
            Player(name: "Chez"),
            Player(name: "Gucci"),
            Player(name: "Ebony")
        ]
        
        let pokerGame = PokerGame(type: .fiveStud, dealer: dealer, players: testPlayers)
        
        try? pokerGame.start()
        for player in pokerGame.allPlayers {
            XCTAssertEqual(player.cards.count, 5)
        }
    }
    
}
