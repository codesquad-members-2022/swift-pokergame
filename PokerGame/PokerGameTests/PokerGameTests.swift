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
    
    func testCardDeck() {
        let cardDeck = CardDeck()
        
        print(cardDeck.deck)
    }
    
    func testCardInstance() {
        (0..<15).forEach {
            guard $0 > 0 && $0 <= 13 else {
                print("nil")
                return
            }
            let card = CardData(pattern: .clover, number: $0)
            print(card.toString())
        }
    }
}
