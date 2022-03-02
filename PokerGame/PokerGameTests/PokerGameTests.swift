//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by Jihee hwang on 2022/02/23.
//

import XCTest

@testable import PokerGame

class PokerGameTests: XCTestCase {
    
    func testPlay() {
        let pokerGame = PokerGame(stud: .five, numberOfPlayer: .three)
        pokerGame.playGame()
        
        XCTAssertEqual(pokerGame.playerCount, 4)
    }
    
}
