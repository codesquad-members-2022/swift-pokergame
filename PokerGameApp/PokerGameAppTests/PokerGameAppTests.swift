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
            Player(),
            Player(),
            Player(),
            Player()
        ]
        var dealer = Dealer(stud: .five)
        let distributedPlayers = dealer.distributeCard(to: players)
        XCTAssertEqual(distributedPlayers[0].cards.count, 5)
    }
}
