//
//  PokerGameLogicTests.swift
//  PokerGameAppTests
//
//  Created by 백상휘 on 2022/02/21.
//

import XCTest
@testable import PokerGameApp

class PokerGameLogicTests: XCTestCase {
    
    let poker = PokerGame()

    func testPokerResult() {
        print(poker)
        print(poker.gameMembers.getNamesInMembers())
        poker.drawCardsToAllMembers()
        print(poker)
        
        let cardCount = poker.dealer.gameType.cardCount
        XCTAssertEqual(cardCount, poker.dealer.cards.count)
        
        for member in poker.gameMembers.members {
            XCTAssertEqual(cardCount, member.cards.count)
        }
    }
}
