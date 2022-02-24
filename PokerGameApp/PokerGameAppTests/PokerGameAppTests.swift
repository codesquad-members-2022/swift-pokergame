//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by jsj on 2022/02/25.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testDistributeCard_isCorrectCardCount() throws {
        let players: [Player] = [
            Player(name: "rosa"),
            Player(name: "rosa"),
            Player(name: "rosa"),
            Player(name: "rosa")
        ]
        var dealer = Dealer(stud: .five)
        let distributedPlayers = dealer.distributeCard(to: players)
        XCTAssertEqual(distributedPlayers[0].cards.count, 5)
    }
    
    func testParticipantFactory_isCorrectGenerateCount() throws {
        let parcipants = ParticipantFactory.generateParcipants(count: .four)
        let expectCount = 4
        XCTAssertEqual(parcipants.count, expectCount)
    }
}
