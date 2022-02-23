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
        XCTAssertEqual(pokerGame.cardDeckCount, 51, "값이 일치하지 않습니다")
    }
    
    func testCardDeckIsEqual() {
        let pokerGame = PokerGame(stud: .fiveCard, playerCount: .four)
        let dealer = pokerGame.dealer
        dealer.draw()
        XCTAssertEqual(pokerGame.cardDeckCount, dealer.cardDeckCount, "값이 일치하지 않습니다")
    }
    
    func testDrawEachPlayerEqual() {
        let pokerGame = PokerGame(stud: .fiveCard, playerCount: .four)
        pokerGame.drawCard(each: 5)
        XCTAssertEqual(pokerGame.players[0].handCount, 5, "드로우가 되지 않았습니다.")
        XCTAssertEqual(pokerGame.players[1].handCount, 5, "드로우가 되지 않았습니다.")
        XCTAssertEqual(pokerGame.players[2].handCount, 5, "드로우가 되지 않았습니다.")
        XCTAssertEqual(pokerGame.players[3].handCount, 5, "드로우가 되지 않았습니다.")
        XCTAssertEqual(pokerGame.players[4].handCount, 5, "드로우가 되지 않았습니다.")
        XCTAssertEqual(pokerGame.cardDeckCount, 27, "드로우가 되지 않았습니다.")
    }
    
    func testPokerGamePlay() {
        var pokerGame = PokerGame(stud: .fiveCard, playerCount: .four)
        pokerGame.play()
        XCTAssertEqual(pokerGame.cardDeckCount, 0, "값이 일치하지 않습니다.")
    }

}
