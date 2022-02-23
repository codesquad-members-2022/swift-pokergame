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
        let dealt = dealer.deal(numOfcards: 7)
        XCTAssertTrue(dealt.count == 7)
    }
    
    func testDealFail() throws {
        let deck = CardDeck()
        let dealer = Dealer(deck: deck)
        for _ in 0..<7 {
            let _ = dealer.deal(numOfcards: 7)
        }
        let dealtToFail = dealer.deal(numOfcards: 7)
        XCTAssertFalse(dealtToFail.count == 7)
    }
    
    func testReceive() throws {
        let john = Player(name: "John")
        XCTAssertEqual(john.cards, [])
        let randomCards = (0..<7).map {
            Card(suit: .hearts, number: CardNumber(rawValue: $0))
        }
        john.receive(cards: [Card(suit: <#T##CardSuit#>, number: <#T##CardNumber#>)])
        XCTAssertEqual(john.cards, [])
    }

}
