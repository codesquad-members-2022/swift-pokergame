//
//  DealerTest.swift
//  DeckTest
//
//  Created by 박진섭 on 2022/02/27.
//

import XCTest
@testable import PokerGame
class DealerTest: XCTestCase {

    var sut:Dealer!
    var playerFactory:PlayerFactory!
    var deckFactory:DeckFactory!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        playerFactory = PlayerFactory()
        deckFactory = DeckFactory()
        
        let deck = DeckFactory.makeDeck()
        let players = PlayerFactory.makePlayers(mode: .singlePlayer)
        
        sut = Dealer(deck: deck, players: players, gameType: .fiveStud)
        sut = Dealer(deck: deck, players: players, gameType: .sevenStud)
    }

    //fiveStud를 플레이 하는 플레이어와 SevenStud를 플레이하는 플레이어들의 카드는 딜러들이 카드를 돌리고 나면 각각 5장,7장이어야 합니다.
    func testDealTheCards() {
        let deck = DeckFactory.makeDeck()
        let fiveStudPlayers = PlayerFactory.makePlayers(mode: .singlePlayer)
        let sevenStudPlayers = PlayerFactory.makePlayers(mode: .singlePlayer)
        
        let fiveStudModeDealer = Dealer(deck: deck, players: fiveStudPlayers, gameType: .fiveStud)
        let sevenStudModeDealer = Dealer(deck: deck, players: sevenStudPlayers, gameType: .sevenStud)
        
        fiveStudModeDealer.dealTheCards()
        sevenStudModeDealer.dealTheCards()
        
        let fiveStudCardCount = fiveStudPlayers.map { $0.cards.count }
        let sevenStudcardCount = sevenStudPlayers.map{ $0.cards.count }
        
        fiveStudCardCount.forEach { XCTAssertTrue($0 == 5) }
        
        sevenStudcardCount.forEach { XCTAssertTrue($0 == 7) }
        
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        playerFactory = nil
        deckFactory = nil
        
        try super.tearDownWithError()
    }
}
