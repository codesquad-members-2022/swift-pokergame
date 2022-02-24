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
    
    enum TestCase {
        
        case one, two, triple, four, straight
        
        func getCard(pattern: [Card.Pattern], numbers: [Card.Number]) -> [Card] {
            switch self {
            case .one:
                if pattern.count < 2 || numbers.count < 1 {
                    return []
                }
                return [
                    Card(pattern: pattern[0], number: numbers[0]),
                    Card(pattern: pattern[1], number: numbers[0])
                ]
            case .two:
                if pattern.count < 2 || numbers.count < 2 {
                    return []
                }
                return [
                    Card(pattern: .clover, number: numbers[0]),
                    Card(pattern: .diamond, number: numbers[0]),
                    Card(pattern: .clover, number: numbers[1]),
                    Card(pattern: .diamond, number: numbers[1])
                ]
            case .triple:
                if pattern.count < 1 || numbers.count < 1 {
                    return []
                }
                return [
                    Card(pattern: .clover, number: numbers[0]),
                    Card(pattern: .diamond, number: numbers[0]),
                    Card(pattern: .heart, number: numbers[0])
                ]
            case .four:
                if pattern.count < 1 || numbers.count < 1 {
                    return []
                }
                return [
                    Card(pattern: .clover, number: numbers[0]),
                    Card(pattern: .diamond, number: numbers[0]),
                    Card(pattern: .heart, number: numbers[0]),
                    Card(pattern: .spade, number: numbers[0])
                ]
            case .straight:
                if numbers.count < 1 && numbers[0].value > 9 {
                    return []
                }
                return (numbers[0].value..<numbers[0].value+5).map {
                    let number = Card.Number.allCases[$0]
                    return Card(pattern: .clover, number: number)
                }
            }
        }
    }
    
    var testPlayerCount: Int = 0
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testDummyPokerStart() {
        let pokerStud = PokerGame.Stud.sevenCard
        let players = [ "테스터1", "테스터2", "테스터3", "테스터4", "딜러"].map {
            Player(name: $0)
        }
        
        let addCard: (Player, [Card]) -> Void = { player, cards in
            cards.forEach {
                player.add(card: $0)
            }
        }
        
        let onePairCards = TestCase.one.getCard(pattern: [.spade, .heart], numbers: [.four])
        let twoPairCards = TestCase.two.getCard(pattern: [.spade, .heart], numbers: [.four, .eight])
        let triplePairCards = TestCase.triple.getCard(pattern: [.spade], numbers: [.four])
        let fourPairCards = TestCase.four.getCard(pattern: [.heart], numbers: [.king])
        let straightPairCards = TestCase.straight.getCard(pattern: [], numbers: [.four])
        
        addCard(players[0], straightPairCards)
        addCard(players[1], fourPairCards)
        addCard(players[2], triplePairCards)
        addCard(players[3], twoPairCards)
        addCard(players[4], onePairCards)
        
        let pokerPlayers = PokerPlayers()
        pokerPlayers.addPlayer(players: players)
        pokerPlayers.scoreCalculation()
        let winner = pokerPlayers.getWinner()
        
        print("-------------------------------")
        players.forEach {
            print($0)
        }
        print("winner: \(winner)")
        print("-------------------------------")
        
        XCTAssertEqual(players[1], winner)
    }
    
    func testPokerStart() {
        let pokerStud = PokerGame.Stud.sevenCard
        let playerCount = 4
        
        let pokerPlayers = PokerPlayers()
        var players: [Player] = []
        
        let pokerGame = PokerGame()
        
        pokerGame.state.resetPokerBoard = { stud, names in
            print("\(pokerStud.cardCount)카드 / 참가자 \(names.count - 1)명 일 때")
            players = names.map {
                Player(name: $0)
            }
            pokerPlayers.addPlayer(players: players)
        }
        
        pokerGame.state.givePlayerCard = { index, _, card in
            players[index].add(card: card)
        }
        
        pokerGame.state.pokerWinner = { winner in
            players.forEach {
                $0.scoreCalculation()
                print($0)
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
        let result = player.scoreCalculated()
        XCTAssertEqual(result?.rule, .straight)
    }
    
    func testPlayerScoreFourCard() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .clover, number: .ace))
        player.add(card: Card(pattern: .spade, number: .two))
        let result = player.scoreCalculated()
        XCTAssertEqual(result?.rule, .fourCard)
    }
    
    func testPlayerScoreTriple() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = player.scoreCalculated()
        XCTAssertEqual(result?.rule, .triple)
    }
    
    func testPlayerScoreTwoPair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = player.scoreCalculated()
        XCTAssertEqual(result?.rule, .twoPair)
    }
    
    func testPlayerScoreOnePair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .diamond, number: .four))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = player.scoreCalculated()
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
