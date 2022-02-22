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
    
    func testPokerCardDistribution() {
        let pokerType = PokerType.sevenCard
        let pokerGame = PokerGame()
        pokerGame.delegate = self
        pokerGame.action.startGame(pokerType, 3)
    }
    
    func getPrint(player: Player) -> String {
        let cards = player.cards.reduce(""){$0 + "\($1), "}.dropLast(2)
        return "\(player.name)\t [\(cards)] "
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
    
    func testCardDeck() {
        let cardDeck = CardDeck()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardInstance() {
        let cards: [CardData] = CardData.CardNumber.allCases.map {
            CardData(pattern: .clover, number: $0)
        }
        XCTAssertEqual(cards.count, 13)
    }
}

extension PokerGameTests: PokerGameDelegate {
    func player(index: Int, player: Player) {
        
    }
    
    func dealer(dealer: Player) {
        
    }
}
