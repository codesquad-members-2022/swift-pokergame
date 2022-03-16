//
//  PockerGameAppTests.swift
//  PockerGameAppTests
//
//  Created by Jason on 2022/03/14.
//

import XCTest
@testable import PockerGameApp

class PockerGameAppTests: XCTestCase {
    private var pockerGame: PockerGame!

    override func setUpWithError() throws {
        pockerGame = PockerGame(stud: .seven, playerCount: .three)
        
    }

    override func tearDownWithError() throws {
        pockerGame = nil
    }

    func testExample() throws {
        pockerGame.playNow()
        
        (0..<pockerGame.participants.count).forEach{ player in
            let playerHandCount = pockerGame.participants.players[player].hand.getCards.count
            XCTAssertEqual(playerHandCount, pockerGame.stud.rawValue,
            "⚠️ Wrong Player Hand Count")
        }
        
        (0..<pockerGame.participants.count).forEach{ Player in
            let playerCount = pockerGame.participants.count
            XCTAssertEqual(playerCount, pockerGame.playerCount.rawValue + 1,
            "⚠️ Wrong Player Hand Count")
        }
    }

}
