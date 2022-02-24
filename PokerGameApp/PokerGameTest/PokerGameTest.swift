//
//  PokerGameTest.swift
//  PokerGameTest
//
//  Created by dale on 2022/02/23.
//

import XCTest
@testable import PokerGameApp

class PokerGameTest: XCTestCase {
    func testDraw() {
        let pokerGame = PokerGame(stud: .fiveCard, playerCount: .four)
        pokerGame.dealer.draw()
        XCTAssertEqual(pokerGame.dealer.cardDeckCount, 51, "값이 일치하지 않습니다")
    }
    
    func testDrawEachPlayerEqual() {
        var pokerGame = PokerGame(stud: .fiveCard, playerCount: .four)
        pokerGame.play()
        XCTAssertEqual(pokerGame.dealer.cardDeckCount, 2, "드로우가 되지 않았습니다.")
    }
    
}
