//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by seongha shin on 2022/02/21.
//

import XCTest

class PokerGameTests: XCTestCase {

    enum Constants {
        static let testPokerType = PokerGame.PokerType.fiveCard
        static let testPlayerCount = 4
    }
    
    var testPlayerCount: Int = 0
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testPokerStart() {
        let pokerGame = PokerGame()
        pokerGame.inputPokerType(pokerType: Constants.testPokerType)
        pokerGame.inputPlayerCount(playerCount: Constants.testPlayerCount)
        
        pokerGame.delegate = self
        pokerGame.start()
    }
    
    func testCardDeckReset() {
        let removeCount = 3
        let cardDeck = CardDeck()
        (0..<removeCount).forEach { _ in
            guard let _ = cardDeck.removeOne() else {
                return
            }
        }
        XCTAssertEqual(cardDeck.count, 52 - removeCount)
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardDeckRemoveOne() {
        let cardDeck = CardDeck()
        var removeCards = [String]()
        (0..<52).forEach { _ in
            guard let card = cardDeck.removeOne() else {
                return
            }
            
            XCTAssertFalse(removeCards.contains(card.description), "중복된 카드가 뽑혔습니다")
            removeCards.append(card.description)
        }
    }
    
    func testCardDeckShuffle() {
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardDeckInstance() {
        let cardDeck = CardDeck()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardInstance() {
        let cards: [Card] = Card.Number.allCases.map {
            Card(pattern: .clover, number: $0)
        }
        XCTAssertEqual(cards.count, 13)
    }
}

extension PokerGameTests: PokerGameDelegate {
    func startPoker() {
        
    }
    
    func player(index: Int, player: Player) {
        XCTAssertEqual(player.cards.count, Constants.testPokerType.rawValue)
        XCTAssertEqual(index, testPlayerCount)
        testPlayerCount += 1
    }
    
    func dealer(dealer: Player) {
        XCTAssertEqual(dealer.cards.count, Constants.testPokerType.rawValue)
    }
}
