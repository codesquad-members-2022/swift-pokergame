//
//  GameTest.swift
//  DeckTest
//
//  Created by 박진섭 on 2022/02/27.
//

import XCTest
@testable import PokerGame
class GameTest: XCTestCase {

    var dealer:Dealer!
    var sut:Game!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let players = PlayerFactory.makePlayers(mode: .threePlayer)
        let deck = DeckFactory.makeDeck()
        
        dealer = Dealer(deck: deck, players: players, gameType: .fiveStud)
        sut = dealer.dealTheCards()
    }

    //함수가 정상적으로 작동되었다면 result에 player의 name과 card들이 포함되어있어야합니다.
    func testShowPlayerCards() {
        let players = PlayerFactory.makePlayers(mode: .threePlayer)
        let deck = DeckFactory.makeDeck()
        dealer = Dealer(deck: deck, players: players, gameType: .fiveStud)
        
        sut = dealer.dealTheCards()
        let names = players.map { $0.name }
        let cards = players.map { $0.cards }
        
        let result = sut.showPlayerCards()
            
        for name in names {
            XCTAssertTrue(result.contains(name))
        }
        for playerCards in cards {
            XCTAssertTrue(result.contains("\(playerCards)"))
        }
    }
    
    //ResultFunc은 ShowPlayerFunc과 로직이 똑같으나 isOver함수만 추가되었으므로 isOver함수가 True일때를 가정해서 Test를 진행해봤습니다.
    func testWhenResultsIsOverTrue() {
        let players = PlayerFactory.makePlayers(mode: .fourPlayer)
        let deck = DeckFactory.makeDeck()
        dealer = Dealer(deck: deck, players: players, gameType: .sevenStud)
        
        sut = dealer.dealTheCards()
        sut = dealer.dealTheCards()
        
        let result = sut.results()
        
        XCTAssertEqual(result, "카드가 더이상 없습니다.")
    }
    
    
    override func tearDownWithError() throws {
        sut = nil
        dealer = nil
        try super.tearDownWithError()
    }
}
