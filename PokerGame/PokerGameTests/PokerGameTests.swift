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
    
    func testPokerStart() {
        let pokerStud = PokerGame.Stud.sevenCard
        let playerCount = 4
        var players: [Player] = []
        
        let pokerGame = PokerGame()
        
        pokerGame.state.resetPokerBoard = { stud, names in
            print("\(pokerStud.cardCount)카드 / 참가자 \(names.count - 1)명 일 때")
            players = names.map {
                Player(name: $0)
            }
        }
        
        pokerGame.state.givePlayerCard = { index, _, card in
            players[index].add(card: card)
        }
        
        pokerGame.state.pokerWinner = { winner in
            players.forEach {
                if let score = Score.calculation(player: $0) {
                    print("\($0) -- \(score)")
                } else {
                    print("\($0) -- 점수없음")
                }
            }
            
            print("승자는 \(winner.name) 입니다!!")
        }
        
        pokerGame.action.inputPokerStud(PokerGame.Stud.sevenCard)
        pokerGame.action.inputPlayerCount(playerCount)
        pokerGame.action.pokerPlay()
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
        let result = Score.calculation(player: player)
        XCTAssertEqual(result?.rule, .straight)
    }
    
    func testPlayerScoreFourCard() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .clover, number: .ace))
        player.add(card: Card(pattern: .spade, number: .two))
        let result = Score.calculation(player: player)
        XCTAssertEqual(result?.rule, .fourCard)
    }
    
    func testPlayerScoreTriple() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = Score.calculation(player: player)
        XCTAssertEqual(result?.rule, .triple)
    }
    
    func testPlayerScoreTwoPair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = Score.calculation(player: player)
        XCTAssertEqual(result?.rule, .twoPair)
    }
    
    func testPlayerScoreOnePair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .diamond, number: .four))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = Score.calculation(player: player)
        XCTAssertEqual(result?.rule, .onePair)
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
