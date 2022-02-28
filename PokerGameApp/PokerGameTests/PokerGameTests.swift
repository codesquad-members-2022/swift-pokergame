//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by 송태환 on 2022/02/25.
//

import XCTest

final class PokerGameTests: XCTestCase {
    var deck = CardDeckFactory.create()
    let spadeAce = Card(rank: .ace, suit: .spade)
    let yourSpadeAce = Card(rank: .ace, suit: .spade)
    var game = PokerGame(rule: .fiveCardStud)
    
    override func setUp() {
        super.setUp()
        self.deck.reset()
    }
    
    func testIfCardDataMatched() {
        XCTAssertFalse(spadeAce == Card(rank: .ace, suit: .diamond), "Both rank and suit of a card must be the same respectively")
        XCTAssertTrue(spadeAce.getRank() == .ace, "Rank is not matched")
        XCTAssertTrue(spadeAce.getSuit() == .spade, "Suit is not matched")
        XCTAssertTrue(spadeAce.description == "♠️A", "Description is not matched")
    }
    
    func testCardIdentity() {
        let copied = spadeAce
        XCTAssertIdentical(spadeAce, copied, "they must be the same instance")
        XCTAssertFalse(spadeAce === yourSpadeAce, "they are not the same instance")
    }
    
    func testCardEquality() {
        let copied = spadeAce
        XCTAssertEqual(spadeAce, yourSpadeAce, "they must be equal but not identical")
        XCTAssertEqual(spadeAce, copied, "they must be equal and identical")
    }
    
    func testCardComparisonByPriority() {
        XCTAssertLessThan(Card(rank: .queen, suit: .diamond), Card(rank: .king, suit: .diamond), "Compare rank if suits are matched")
        XCTAssertLessThan(Card(rank: .king, suit: .diamond), Card(rank: .king, suit: .spade), "Compare suits if rank is matched")
    }
    
    func testCardDeck() {
        XCTAssertTrue(deck.count ==  52, "Total number of cards is 52")
        XCTAssertNotNil(deck.removeOne())
        
        _ = deck.removeOne()
        _ = deck.removeOne()
        XCTAssertTrue(deck.count ==  49, "Total number of cards is 49")
        
        for _ in 0...52 {
            _ = deck.removeOne()
        }
        
        XCTAssertNil(deck.removeOne())
        XCTAssertTrue(deck.count == 0, "Deck must be empty")
        
        deck.shuffle()
        XCTAssertNil(deck.removeOne())
        XCTAssertTrue(deck.count == 0, "Deck must be empty")
    }
    
    func testPlayer() {
        let player = Player(name: "Player")
        player.receive(card: Card(rank: .ace, suit: .diamond))
        player.receive(card: Card(rank: .ace, suit: .clover))
        
        XCTAssertEqual(player.cards.count, 2)
        
        player.emptyCards()
        XCTAssertEqual(player.cards.count, 0)
    }
    
    func testDealerInitializer() {
        let dealer = Dealer(deck: self.deck, rule: .fiveCardStud)
        
        XCTAssertEqual(dealer.cards.count, 0)
        XCTAssertEqual(dealer.rule, .fiveCardStud)
        XCTAssertNil(dealer.delegate)
    }
    
    func testDealerMethods() {
        let dealer = Dealer(deck: self.deck, rule: .fiveCardStud)
        
        dealer.receive(card: self.spadeAce)
        dealer.receive(card: self.yourSpadeAce)
        XCTAssertTrue(dealer.cards.count == 2)
        
        dealer.emptyCards()
        XCTAssertEqual(dealer.cards.count, 0)
        
        dealer.setRule(rule: .sevenCardStud)
        XCTAssertEqual(dealer.rule, .sevenCardStud)
    }
    
    func testPokerGame() {
        XCTAssertNoThrow(try game.setPlayers(count: 9))
        XCTAssertThrowsError(try game.setPlayers(count: 11))
        XCTAssertEqual(game.players.count, 9)
        
        game.run()
        let result = game.players.reduce(0) { $0 + $1.cards.count }
        XCTAssertEqual(result, 0, "게임이 종료되면 플레이어가 가진 카드는 모두 회수되어야 합니다.")
    }
}
