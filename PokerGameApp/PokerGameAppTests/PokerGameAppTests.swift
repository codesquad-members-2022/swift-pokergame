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
    }

}
