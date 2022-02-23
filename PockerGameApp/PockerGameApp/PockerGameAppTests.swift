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
    
    func testExample() throws {
        XCTAssertEqual((1+1), 2)
    }
    
    func testReset() throws{
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testRemoveOne() throws{
        let count = cardDeck.count
        cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count, count - 1)
    }
    
    func testShuffle() throws{
        let deckCards = cardDeck.cardDeckArray
        cardDeck.shuffle()
        let duplicated = zip(cardDeck.cardDeckArray, deckCards).enumerated().filter() {
            $1.0.number == $1.1.number && $1.0.shape == $1.1.shape
        }
        let duplicatedCount = duplicated.map{$0.offset}.count
        XCTAssertTrue(deckCards.count > duplicatedCount)
    }

}
