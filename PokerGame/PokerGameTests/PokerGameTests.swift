//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by seongha shin on 2022/02/21.
//

import XCTest

class PokerGameTests: XCTestCase {

    enum TestCase {
        case noScore, one, two, triple, four, straight
        
        var cards: [Card] {
            switch self {
            case .noScore:
                return TestCase.noScore.getCard(pattern: [], numbers: [])
            case .one:
                return TestCase.one.getCard(pattern: [.spade, .heart], numbers: [.four])
            case .two:
                return TestCase.two.getCard(pattern: [.spade, .heart], numbers: [.four, .eight])
            case .triple:
                return TestCase.triple.getCard(pattern: [.spade], numbers: [.four])
            case .four:
                return TestCase.four.getCard(pattern: [.heart], numbers: [.king])
            case .straight:
                return TestCase.straight.getCard(pattern: [], numbers: [.four])
            }
        }
        
        private func getCard(pattern: [Card.Pattern], numbers: [Card.Number]) -> [Card] {
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
    
    let addCard: (Player, [Card]) -> Void = { player, cards in
        cards.forEach {
            player.add(card: $0)
        }
    }
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testGetWinner() {
        
        //플레이어에 테스트 카드 설정
        //딕셔너리를 사용하므로 이름순으로 정렬해줌
        let players = [
            "0.테스터":TestCase.one.cards,
            "1.테스터":TestCase.two.cards,
            "2.테스터":TestCase.triple.cards,
            "3.테스터":TestCase.four.cards,
            "4.딜러":TestCase.straight.cards
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
    
    func testScoreRule() {
        let players = [
            "0.테스터":TestCase.one.cards,
            "1.테스터":TestCase.two.cards,
            "2.테스터":TestCase.triple.cards,
            "3.테스터":TestCase.four.cards,
            "4.딜러":TestCase.straight.cards
        ].map { pair -> Player in
                let player = Player(name: pair.key)
                addCard(player, pair.value)
                return player
        }.sorted{
            $0.name < $1.name
        }
        
        XCTAssertEqual(players[0].score?.rule, .onePair)
        XCTAssertEqual(players[1].score?.rule, .twoPair)
        XCTAssertEqual(players[2].score?.rule, .triple)
        XCTAssertEqual(players[3].score?.rule, .fourCard)
        XCTAssertEqual(players[4].score?.rule, .straight)
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
