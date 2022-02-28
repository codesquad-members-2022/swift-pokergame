//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by 백상휘 on 2022/02/21.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    
    let poker = PokerGame()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPoker() {
        
        print("이름 한번씩 말씀해주십시오.")
        print(poker.gameMembers)
        
        print("카드 준비중입니다.")
        print("카드를 섞습니다.")
        
        poker.drawCardsToAllMembers()
        
        XCTAssertEqual(
            CardDeck(.deck).count(),
            poker.dealer.cards.count + poker.gameMembers.members.reduce(0, {$0+$1.cards.count}) + poker.dealer.deck.count()
        )
        
        print(poker)
        
        while let _ = poker.dealer.draw() {
            continue
        }
        
        XCTAssertEqual(poker.dealer.deck.count(), 0)
    }
}
