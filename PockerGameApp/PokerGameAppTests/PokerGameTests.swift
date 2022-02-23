//
//  PokerGameTests.swift
//  PokerGameAppTests
//
//  Created by Bumgeun Song on 2022/02/23.
//

import XCTest
@testable import PokerGameApp

class PokerGameTests: XCTestCase {
    var testPlayers: [Player]!
    var deck: CardDeck!
    var dealer: Dealer!
    
    override func setUp() {
        self.testPlayers = [
            Player(name: "Eddy"),
            Player(name: "Jason"),
            Player(name: "Chez"),
            Player(name: "Gucci"),
            Player(name: "Ebony")
        ]
        self.deck = CardDeck()
        self.dealer = Dealer(deck: deck, players: testPlayers)
    }
    
    func testExample() throws {
        XCTAssertEqual(1+1, 2)
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
        let pokerGame = PokerGame(type: .sevenStud, dealer: dealer)
        
        try? pokerGame.start()
        
        let allPlayers: [Playable] = dealer.players + [dealer]
        for player in allPlayers {
            XCTAssertEqual(player.cards.count, 7)
        }
    }
    
    func testFiveStudGame() throws {
        let pokerGame = PokerGame(type: .fiveStud, dealer: dealer)
        
        try? pokerGame.start()
        
        let allPlayers: [Playable] = dealer.players + [dealer]
        for player in allPlayers {
            XCTAssertEqual(player.cards.count, 5)
        }
    }
    
    
    func testDealwithTooManyPlayer() throws {
        let testPlayers = [
            Player(name: "Eddy"),
            Player(name: "Jason"),
            Player(name: "Chez"),
            Player(name: "Gucci"),
            Player(name: "Dale"),
            Player(name: "Seilna"),
            Player(name: "Jed"),
            Player(name: "Jee"),
            Player(name: "Ebony")
        ]
        
        let deck = CardDeck()
        let dealer = Dealer(deck: deck, players: testPlayers)
        
        var thrownError: Error!
        XCTAssertThrowsError(try dealer.deal(numOfcards: PokerType.sevenStud.numberOfCards)) {
            thrownError = $0
        }
        XCTAssertTrue(thrownError as? PokerGameError == .tooManyPlayer)
    }
    
    
}
