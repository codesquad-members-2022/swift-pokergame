//
//  PockerGameAppTests.swift
//  PockerGameAppTests
//
//  Created by 김한솔 on 2022/02/22.
//

import XCTest
@testable import PockerGameApp

class PockerGameAppTests: XCTestCase {

    func testInitializeOfCardDeck() {
        var cardArrayMustBeEqual = [Card]()
        
        for numberCase in Card.Number.allCases {
            for symbolCase in Card.Symbol.allCases {
                cardArrayMustBeEqual.append(Card(number: numberCase, symbol: symbolCase))
            }
        }
        
        XCTAssertEqual(CardDeck.init(), CardDeck.init(with: cardArrayMustBeEqual), "초기화된 값이 일치하지 않습니다.")
    }
    
    func testShuffleOfCardDeck() {
        let testCardDeck1 = CardDeck()
        var testCardDeck2 = CardDeck()
        
        testCardDeck2.shuffle()
        
        XCTAssertNotEqual(testCardDeck1, testCardDeck2, "셔플되지 않았습니다.")
    }
    
    func testRemoveOneOfCardDeck() {
        var testCardDeck = CardDeck()
        let previousCardsCount = testCardDeck.count
        let tempCardBeforeRemoved = testCardDeck.last()
        
        XCTAssertEqual(tempCardBeforeRemoved, testCardDeck.removeOne(), "올바른 카드가 제거되지 않았습니다.")
        XCTAssertEqual(testCardDeck.count, previousCardsCount - 1, "한 장이 뽑혀 제거되지 않았습니다.")
    }
    
    func testDistributeCardInPokerGame() {
        let testPokerGame = PokerGame(numberOfGamblers: 3)
        testPokerGame.distributeCard()
        
        var countCards: Int {
            return testPokerGame.gamblers.reduce(0) { previousSum, nextGambler in
                return previousSum + nextGambler.cardDeck.count
            } + testPokerGame.dealer.cardDeck.count
        }
        
        XCTAssertTrue(countCards == testPokerGame.gameRule.numberOfCard * (testPokerGame.gamblers.count + 1), "제대로 카드가 나눠지지 않았습니다.")
    }
}
