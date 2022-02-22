//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by seongha shin on 2022/02/21.
//

import XCTest

class PokerGameTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testCardDeckReset() {
        let removeCount = 3
        let cardDeck = CardDeck()
        (0..<removeCount).forEach { _ in
            guard let card = cardDeck.removeOne() else {
                print("카드를 못뽑았습니다.")
                return
            }
            print("뽑은카드: \(card)")
        }
        XCTAssertEqual(cardDeck.count, 52 - removeCount)
        
        print("카드 덱 리셋")
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardDeckRemoveOne() {
        let cardDeck = CardDeck()
        var removeCard = [String]()
        (0..<52).forEach { index in
            guard let card = cardDeck.removeOne() else {
                return
            }
            
            XCTAssertFalse(removeCard.contains(card.description), "중복된 카드가 뽑혔습니다!")
            removeCard.append(card.description)
        }
        XCTAssertEqual(cardDeck.count, 51)
    }
    
    func testCardDeckShuffle() {
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        print(cardDeck.deck)
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardDeck() {
        let cardDeck = CardDeck()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardInstance() {
        let cards = (0..<15).flatMap { number -> CardData? in
            guard number > 0 && number <= 13 else {
                print("nil")
                return nil
            }
            return CardData(pattern: .clover, number: number)
        }
        XCTAssertEqual(cards.count, 13)
    }
}
