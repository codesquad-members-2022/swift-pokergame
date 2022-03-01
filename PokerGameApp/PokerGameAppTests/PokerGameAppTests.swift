//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by 최예주 on 2022/02/25.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {

    var game: PokerGame!
    var dealer = Dealer()
    var player = Player(name: "test")
    
    override func setUpWithError() throws {
        game = PokerGame(stud: .seven, playerCount: 3)
    }
    
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    
    func testDeal() throws {
        player.receive(dealer.deal())
        XCTAssertEqual(player.cardCount, 1)
    }
    
    // deal을 한후 카드개수가 동일한지 테스트
    func testDistributeCard() throws{
        let participants = Players(playerCount: 3, dealer:dealer)
        dealer.distributeCard(to : participants, by: 5)
        XCTAssertEqual(participants.players[0].cardCount, 5, "카드가 동일하게 배분되지 않았습니다.")
    }
    
  
    

}
