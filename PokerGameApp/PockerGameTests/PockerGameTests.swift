//
//  PockerGameTests.swift
//  PockerGameTests
//
//  Created by 송태환 on 2022/02/25.
//

import XCTest

final class PockerGameTests: XCTestCase {
    private let factory = CardDeckFactory()
    
    func testCard() {
        let spadeAce = Card(rank: .ace, suit: .spade)
        let yourSpadeAce = Card(rank: .ace, suit: .spade)
        let copied = spadeAce
        
        // Identity Check
        XCTAssertIdentical(spadeAce, copied, "they must be the same instance")
        XCTAssertFalse(spadeAce === yourSpadeAce, "they are not the same instance")
        
        // Equality Check
        XCTAssertEqual(spadeAce, yourSpadeAce, "they must be equal but not identical")
        XCTAssertEqual(spadeAce, copied, "they must be equal and identical")
        
        XCTAssertFalse(spadeAce == Card(rank: .ace, suit: .diamond), "Both rank and suit of a card must be the same respectively")
        XCTAssertTrue(spadeAce.getRank() == .ace, "Rank is not matched")
        XCTAssertTrue(spadeAce.getSuit() == .spade, "Suit is not matched")
        XCTAssertTrue(spadeAce.description == "♠️A", "Description is not matched")
        
        // Comparision Check
        XCTAssertLessThan(Card(rank: .queen, suit: .diamond), Card(rank: .king, suit: .diamond), "Compare rank if suits are matched")
        XCTAssertLessThan(Card(rank: .king, suit: .diamond), Card(rank: .king, suit: .spade), "Compare suits if rank is matched")
    }
    
    func testCardDeck() {
        var deck = self.factory.create()
        XCTAssertTrue(deck.count ==  52, "Total number of cards is 52")
        
        XCTAssertNotNil(deck.removeOne())
        
        deck.removeOne()
        deck.removeOne()
        XCTAssertTrue(deck.count ==  49, "Total number of cards is 49")
        
        for _ in 0...52 {
            deck.removeOne()
        }
        
        XCTAssertNil(deck.removeOne())
        XCTAssertTrue(deck.count == 0, "Deck must be empty")
        
        deck.shuffle()
        XCTAssertNil(deck.removeOne())
        XCTAssertTrue(deck.count == 0, "Deck must be empty")
    }
}
