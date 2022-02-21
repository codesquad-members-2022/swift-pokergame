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
        let pokerGame = PokerGame(playType: pokerType, playerCount: 3)
        pokerGame.play()
        
        let player = pokerGame.players
        player.forEach {
            print(getPrint(player: $0))
        }
        
        print(getPrint(player: pokerGame.dealer))
        
        player.forEach {
            XCTAssertEqual($0.cards.count, pokerType.rawValue)
        }
        XCTAssertEqual(pokerGame.dealer.cards.count, pokerType.rawValue)
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
 
            let stringCard = card.toString()
            print(stringCard)
            
            XCTAssertFalse(removeCards.contains(stringCard), "중복된 카드가 뽑혔습니다")
            removeCards.append(stringCard)
        }
    }
    
    func testCardDeckShuffle() {
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        print(cardDeck.deck)
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardDeck() {
        let cardDeck = CardDeck()
        XCTAssertEqual(cardDeck.count, 52)
    }
    
    func testCardInstance() {
        let cards = (0..<15).compactMap { number -> CardData? in
            guard number > 0 && number <= 13 else {
                print("nil")
                return nil
            }
            return CardData(pattern: .clover, number: number)
        }
        XCTAssertEqual(cards.count, 13)
    }
}
