//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by jsj on 2022/02/25.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    
    func testAfterPrepare_isSameCardCountPlayers() {
        let game = PokerGame(stud: .seven, guestCount: .four)
        game.prepare()
        let playersState = game.playersState()
        
        var isNotSameCardCount = false
        for state in playersState {
            if state.cards.count != 7 {
                isNotSameCardCount = true
            }
        }
        XCTAssertEqual(playersState.count, 5)
        XCTAssertFalse(isNotSameCardCount, "게임 준비 후, 모든 참가자의 카드갯수가 7장이다")
    }
    
    func testParticipantFactory_isCorrectGenerateCount() throws {
        let guests = ParticipantFactory.generateGuests(count: .four)
        let expectCount = 4
        XCTAssertEqual(guests.count, expectCount)
    }
}
