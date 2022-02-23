//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by Jihee hwang on 2022/02/23.
//

import XCTest

@testable import PokerGame

class PokerGameTests: XCTestCase {
    
    func testCardDeck() {
        let test = CardDeck()
        XCTAssert(test)
        
    }
    

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        measure {
        }
    }

}
