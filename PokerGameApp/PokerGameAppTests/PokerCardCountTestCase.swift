//
//  PokerCardCountTestCase.swift
//  PokerGameAppTests
//
//  Created by 백상휘 on 2022/02/28.
//

import XCTest
@testable import PokerGameApp

class PokerCardCountTestCase: XCTestCase {

    let poker = PokerGame()

    func testCountExamine() throws {
        poker.drawCardsToAllMembers()
        
        let dealerOwns = poker.dealer.cards.count
        let membersOwn = poker.gameMembers.members.reduce(0, {$0+$1.cards.count})
        let remains = poker.dealer.deck.count()
        
        XCTAssertEqual(52, dealerOwns + membersOwn + remains)
        
        while let _ = poker.dealer.draw() {
            continue
        }
        
        XCTAssertEqual(poker.dealer.deck.count(), 0)
    }
}
