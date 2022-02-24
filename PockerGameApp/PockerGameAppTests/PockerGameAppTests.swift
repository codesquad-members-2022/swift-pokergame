//
//  PockerGameAppTests.swift
//  PockerGameAppTests
//
//  Created by 김동준 on 2022/02/23.
//

import XCTest
import UIKit
@testable import PockerGameApp

class PockerGameAppTests: XCTestCase {
    private var cardDeck = CardDeck()
    
    func testReset() throws{
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testRemoveOne() throws{
        let count = cardDeck.count
        cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count, count - 1)
    }
    
    func testShuffle() throws{
        XCTAssertEqual(cardDeck.testShuffle(), true)
    }
}
