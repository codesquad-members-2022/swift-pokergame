//
//  PockerGameTests.swift
//  PockerGameTests
//
//  Created by 송태환 on 2022/02/25.
//

import XCTest

class PockerGameTests: XCTestCase {

    override func setUpWithError() throws {
        try? super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
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
        
    }
    
    func testCardDeckFactory() {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
