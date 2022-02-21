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
        let cardDeck = CardDeck()
        (0..<3).forEach { _ in
            guard let card = cardDeck.removeOne() else {
                print("카드를 못뽑았습니다.")
                return
            }
            print("뽑은카드: \(card)")
        }
        print("남은 카드 갯수: \(cardDeck.count)")
        
        print("카드 덱 리셋")
        cardDeck.reset()
        print("남은 카드 갯수: \(cardDeck.count)")
    }
    
    func testCardDeckRemoveOne() {
        let cardDeck = CardDeck()
        guard let card = cardDeck.removeOne() else {
            print("카드를 못뽑았습니다.")
            return
        }
        print("뽑은카드: \(card)")
        print("남은 카드 갯수: \(cardDeck.count)")
    }
    
    func testCardDeckShuffle() {
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        print(cardDeck.deck)
        print("남은 카드 갯수: \(cardDeck.count)")
    }
    
    func testCardDeck() {
        let cardDeck = CardDeck()
        print(cardDeck.deck)
        print("남은 카드 갯수: \(cardDeck.count)")
    }
    
    func testCardInstance() {
        (0..<15).forEach {
            guard $0 > 0 && $0 <= 13 else {
                print("nil")
                return
            }
            let card = CardData(pattern: .clover, number: $0)
            print(card)
        }
    }
}
