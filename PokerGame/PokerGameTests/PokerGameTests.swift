//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by seongha shin on 2022/02/21.
//

import XCTest

class PokerGameTests: XCTestCase {

    enum Constants {
        static let testPokerStud = PokerGame.Stud.fiveCard
        static let testPlayerCount = 4
    }
    
    var testPlayerCount: Int = 0
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testPlayerScoreStraight() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .clover, number: .four))
        player.add(card: Card(pattern: .spade, number: .five))
        player.add(card: Card(pattern: .spade, number: .six))
        player.add(card: Card(pattern: .spade, number: .seven))
        player.add(card: Card(pattern: .spade, number: .eight))
        XCTAssertEqual(Score.calculation(player: player).0, .straight)
    }
    
    func testPlayerScoreFourCard() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .clover, number: .ace))
        player.add(card: Card(pattern: .spade, number: .two))
        XCTAssertEqual(Score.calculation(player: player).0, .fourCard)
    }
    
    func testPlayerScoreTriple() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        XCTAssertEqual(Score.calculation(player: player).0, .triple)
    }
    
    func testPlayerScoreTwoPair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        XCTAssertEqual(Score.calculation(player: player).0, .twoPair)
    }
    
    func testPlayerScoreOnePair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .diamond, number: .four))
        player.add(card: Card(pattern: .diamond, number: .six))
        XCTAssertEqual(Score.calculation(player: player).0, .onePair)
    }

    
    func testPokerStart() {
        let pokerGame = PokerGame()
        
        let players = (0..<4).map { index -> Player in
            Player(name: "tester\(index)")
        }
        
        pokerGame.state.givePlayerCard = { index, _, card in
            players[index].add(card: card)
        }
        
        pokerGame.action.inputPokerType(.sevenCard)
        pokerGame.action.inputPlayerCount(players.count)
        pokerGame.action.pokerPlay()
        
        players.forEach {
            $0.sort()
            let score = Score.calculation(player: $0)
            print("\($0) -- \(score.1)")
        }
        
//        
//        pokerGame.state.didCreatePlayers = { players in
//            XCTAssertEqual(players.count, Constants.testPlayerCount)
//            
//            players.forEach {
//                XCTAssertEqual($0.cards.count, Constants.testPokerType.rawValue)
//            }
//        }
//        
//        pokerGame.state.didCreateDealer = { dealer in
//            XCTAssertEqual(dealer.cards.count, Constants.testPokerType.rawValue)
//        }
//                
//        pokerGame.action.inputPokerType(Constants.testPokerType)
//        pokerGame.action.inputPlayerCount(Constants.testPlayerCount)
//        pokerGame.action.pokerStart()
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
        var removedCards = [Card]()
        (0..<52).forEach { _ in
            guard let card = cardDeck.removeOne() else {
                return
            }
            
            removedCards.forEach {
                XCTAssertFalse($0 == card, "중복된 카드가 뽑혔습니다")
            }
            removedCards.append(card)
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
