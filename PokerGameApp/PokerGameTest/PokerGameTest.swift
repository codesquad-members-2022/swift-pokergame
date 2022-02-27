//
//  PokerGameTest.swift
//  PokerGameTest
//
//  Created by dale on 2022/02/23.
//

import XCTest
@testable import PokerGameApp

class PokerGameTest: XCTestCase {

    func testPlay() {
        var pokerGame = PokerGame(stud: .fiveCard, playerCount: .four)
        pokerGame.play()
        XCTAssertEqual(pokerGame.remainCardCount, 27, "게임결과가 잘못되었습니다.")
    }
    
}
