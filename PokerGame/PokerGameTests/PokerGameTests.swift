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
        
        case noScore, one, two, triple, four, straight
        
        @discardableResult
        func getCard(pattern: [Card.Pattern], numbers: [Card.Number]) -> [Card] {
            switch self {
            case .noScore:
                return [
                    Card(pattern: .heart, number: .king)
                ]
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
        //플레이어에 카드 넣어주는 함수
        let addCard: (Player, [Card]) -> Void = { player, cards in
            cards.forEach {
                player.add(card: $0)
            }
        }
        
        //테스트 카드 샘플
        let noScoreCards = TestCase.noScore.getCard(pattern: [], numbers: [])
        let onePairCards = TestCase.one.getCard(pattern: [.spade, .heart], numbers: [.four])
        let twoPairCards = TestCase.two.getCard(pattern: [.spade, .heart], numbers: [.four, .eight])
        let triplePairCards = TestCase.triple.getCard(pattern: [.spade], numbers: [.four])
        let fourPairCards = TestCase.four.getCard(pattern: [.heart], numbers: [.king])
        let straightPairCards = TestCase.straight.getCard(pattern: [], numbers: [.four])
        
        //플레이어에 테스트 카드 설정
        //딕셔너리를 사용하므로 이름순으로 정렬해줌
        let players = [
            "0.테스터":noScoreCards,
            "1.테스터":triplePairCards,
            "2.테스터":onePairCards,
            "3.테스터":straightPairCards,
            "4.딜러":noScoreCards
        ].map { pair -> Player in
                let player = Player(name: pair.key)
                addCard(player, pair.value)
                return player
        }.sorted{
            $0.name < $1.name
        }
        
        //위의 테스트 데이터를 넣고 누가 이기는지 인덱스를 여기에 입력함
        let checkWinnerIndex = 3
        
        //비지니스 로직 실행
        let pokerPlayers = PokerPlayers()
        pokerPlayers.addPlayer(players: players)
        let winner = pokerPlayers.getWinner()
        
        print("-------------------------------")
        players.forEach {
            print($0)
        }
        if let winner = winner {
            print("winner: \(winner)")
        } else {
            print("승자가 없습니다")
        }
        print("-------------------------------")
        
        XCTAssertEqual(players[checkWinnerIndex].score, winner)
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
        let result = player.score
        XCTAssertEqual(result?.rule, .straight)
    }
    
    func testPlayerScoreFourCard() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .clover, number: .ace))
        player.add(card: Card(pattern: .spade, number: .two))
        let result = player.score
        XCTAssertEqual(result?.rule, .fourCard)
    }
    
    func testPlayerScoreTriple() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .ace))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = player.score
        XCTAssertEqual(result?.rule, .triple)
    }
    
    func testPlayerScoreTwoPair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .heart, number: .two))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = player.score
        XCTAssertEqual(result?.rule, .twoPair)
    }
    
    func testPlayerScoreOnePair() {
        let player = Player(name: "tester")
        player.add(card: Card(pattern: .spade, number: .ace))
        player.add(card: Card(pattern: .heart, number: .ace))
        player.add(card: Card(pattern: .diamond, number: .two))
        player.add(card: Card(pattern: .diamond, number: .four))
        player.add(card: Card(pattern: .diamond, number: .six))
        let result = player.score
        XCTAssertEqual(result?.rule, .onePair)
    }
    
    func testCardDeckReset() {
        let cardDeck = CardDeck()
        
        let removeCount = 3
        (0..<removeCount).forEach { _ in
            guard let _ = cardDeck.removeOne() else {
                return
            }
        }
        
        XCTAssertEqual(cardDeck.count, 52 - removeCount)
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count, 52, "카드덱 리셋이 안됬습니다")
    }
    
    func testCardDeckRemoveOne() {        
        let cardDeck = CardDeck()
        cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count, 51, "카드가 제거되지 않았습니다")
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
