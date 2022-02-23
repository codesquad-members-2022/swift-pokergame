//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by Bumgeun Song on 2022/02/23.
//

import XCTest
@testable import PokerGameApp

class CardDeckTests: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(1+1, 2)
    }
    
    func testCardDeckInitilzer() throws {
        let deck = CardDeck()
        XCTAssertEqual(deck.count, 52)
    }
    
    func testIsSuffledWhenInitialized() throws {
        let deck = CardDeck()
        XCTAssertEqual("\(deck)", "[♠️A, ♠️2, ♠️3, ♠️4, ♠️5, ♠️6, ♠️7, ♠️8, ♠️9, ♠️10, ♠️J, ♠️Q, ♠️K, ♣️A, ♣️2, ♣️3, ♣️4, ♣️5, ♣️6, ♣️7, ♣️8, ♣️9, ♣️10, ♣️J, ♣️Q, ♣️K, ♥️A, ♥️2, ♥️3, ♥️4, ♥️5, ♥️6, ♥️7, ♥️8, ♥️9, ♥️10, ♥️J, ♥️Q, ♥️K, ♦️A, ♦️2, ♦️3, ♦️4, ♦️5, ♦️6, ♦️7, ♦️8, ♦️9, ♦️10, ♦️J, ♦️Q, ♦️K]")
    }
    
    func testShuffle() throws {
        var deck = CardDeck()
        XCTAssertNotEqual("\(deck.shuffle())", "[♠️A, ♠️2, ♠️3, ♠️4, ♠️5, ♠️6, ♠️7, ♠️8, ♠️9, ♠️10, ♠️J, ♠️Q, ♠️K, ♣️A, ♣️2, ♣️3, ♣️4, ♣️5, ♣️6, ♣️7, ♣️8, ♣️9, ♣️10, ♣️J, ♣️Q, ♣️K, ♥️A, ♥️2, ♥️3, ♥️4, ♥️5, ♥️6, ♥️7, ♥️8, ♥️9, ♥️10, ♥️J, ♥️Q, ♥️K, ♦️A, ♦️2, ♦️3, ♦️4, ♦️5, ♦️6, ♦️7, ♦️8, ♦️9, ♦️10, ♦️J, ♦️Q, ♦️K]")
    }
    
    func testDraw() throws {
        var deck = CardDeck()
        let _ = deck.draw()
        XCTAssertTrue(deck.count == 51)
        let _ = deck.draw()
        XCTAssertTrue(deck.count == 50)
    }
    
    func testReset() throws {
        var deck = CardDeck()
        let _ = deck.draw(), _ = deck.draw()
        deck.reset()
        XCTAssertEqual(deck.count, 52)
    }
}
