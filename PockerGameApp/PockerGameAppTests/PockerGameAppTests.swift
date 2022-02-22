//
//  PockerGameAppTests.swift
//  PockerGameAppTests
//
//  Created by 김한솔 on 2022/02/22.
//

import XCTest
@testable import PockerGameApp

class PockerGameAppTests: XCTestCase {

    func testScenario() throws {
        
    }

    func initializeCardDeckTest() {
        var cardArrayMustBeEqual = [Card]()
        
        for numberCase in Card.Number.allCases {
            for symbolCase in Card.Symbol.allCases {
                cardArrayMustBeEqual.append(Card(number: numberCase, symbol: symbolCase))
            }
        }
        
        XCTAssertEqual(CardDeck.init(), CardDeck.init(cardArrayMustBeEqual), "초기화된 값이 일치하지 않습니다.")
    }
    
    func shuffleCardDeckTest() {
        let testCardDeck1 = CardDeck()
        var testCardDeck2 = CardDeck()
        
        testCardDeck2.shuffle()
        
        XCTAssertNotEqual(testCardDeck1, testCardDeck2, "셔플되지 않았습니다.")
    }
    
    func removeCardDeckTest() {
        var testCardDeck = CardDeck()
        let previousCardsCount = testCardDeck.count
        print(testCardDeck.removeOne()!)
        
        XCTAssertEqual(testCardDeck.count, previousCardsCount - 1, "한 장이 뽑혀 제거되지 않았습니다.")
    }
}
