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
        dealer = Dealer(deck: deck, gameType: .fiveStud)
        dealer = Dealer(deck: deck, gameType: .sevenStud)
        
        sut = Game(dealer: dealer, players: players)
    }

    //함수가 정상적으로 작동되었다면 result에 player의 name과 card들이 포함되어있어야합니다.
    func teststart() {
        let players = PlayerFactory.makePlayers(mode: .threePlayer)
        let deck = DeckFactory.makeDeck()
        dealer = Dealer(deck: deck, gameType: .sevenStud)
        
        sut = Game(dealer: dealer, players: players)
        
        let noErrorResult = sut.start()                               //함수실행시 오류를 나타내는 String이 리턴되지 않아야합니다.
        
        sut.start()
        sut.start()
        sut.start()
        
        let errorResult = sut.start()
        
        XCTAssertNotEqual(noErrorResult, GameStatus.errorCase.status)
        
        XCTAssertEqual(errorResult, GameStatus.errorCase.status)
        
    }

    override func tearDownWithError() throws {
        sut = nil
        dealer = nil
        try super.tearDownWithError()
    }
}
