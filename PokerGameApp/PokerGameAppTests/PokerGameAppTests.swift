//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by jsj on 2022/02/25.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    }
    
    
    func testDistributeCard_isCorrectCardCount() throws {
        let player = Player(name: "rosa")
        var dealer = Dealer(name: "dealer", stud: .five)
        let distributedPlayers = dealer.distributeCard(to: [player])
//        XCTAssertEqual(distributedPlayers[0], 5)
    }
    
    func testParticipantFactory_isCorrectGenerateCount() throws {
        let guests = ParticipantFactory.generateGuests(count: .four)
        let expectCount = 4
        XCTAssertEqual(guests.count, expectCount)
    }
}
