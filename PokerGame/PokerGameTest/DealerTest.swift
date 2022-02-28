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
        
        sut = Dealer(deck: deck, gameType: .fiveStud)
        sut = Dealer(deck: deck, gameType: .sevenStud)
    }

    //Deck에 남아있는 카드의 수는 딜러들이 카드를 돌리고 나면 player수와 Stud에 따라 없어져야합니다.
    //Deck에 남아있는 카드가 없다면 함수는 false를 리턴합니다.
    func testDealTheCards() {
        let deck = DeckFactory.makeDeck()
        let fiveStudPlayers = PlayerFactory.makePlayers(mode: .singlePlayer)
        let sevenStudPlayers = PlayerFactory.makePlayers(mode: .singlePlayer)
        
        let fiveStudModeDealer = Dealer(deck: deck , gameType: .fiveStud)
        let sevenStudModeDealer = Dealer(deck: deck, gameType: .sevenStud)
        
        let dealFive = fiveStudModeDealer.dealTheCards(players: fiveStudPlayers)
        let deckCountAfterFiveCardDeal = deck.count
        
        let dealSeven = sevenStudModeDealer.dealTheCards(players: sevenStudPlayers)
        let deckCountAfterSeveneCardDeal = deck.count
        
        //Deck의 카드를 모두 소진
        sevenStudModeDealer.dealTheCards(players: sevenStudPlayers)
        sevenStudModeDealer.dealTheCards(players: sevenStudPlayers)
        sevenStudModeDealer.dealTheCards(players: sevenStudPlayers)
        let noCardInDeckCase = sevenStudModeDealer.dealTheCards(players: sevenStudPlayers)
        
        
        
        XCTAssertTrue(dealFive)
        XCTAssertTrue(dealSeven)
        XCTAssertFalse(noCardInDeckCase)
        
        XCTAssertEqual(deckCountAfterFiveCardDeal, 42)
        XCTAssertEqual(deckCountAfterSeveneCardDeal, 28)
        
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        playerFactory = nil
        deckFactory = nil
        
        try super.tearDownWithError()
    }
}
