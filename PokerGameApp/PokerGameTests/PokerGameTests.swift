//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by 김상혁 on 2022/02/25.
//

import XCTest
@testable import PokerGame

class PokerGameTests: XCTestCase {
    private var pokerGame: PokerGame!
    
    override func setUp() {
        pokerGame = PokerGame(stud: .seven, playerCount: .three) 
        super.setUp()
    }
    
    override func tearDown() {
        pokerGame = nil
        super.tearDown()
    }
    
    func testByPrint() {
        pokerGame.start()
        (0..<pokerGame.participants.count).forEach { player in
            print(pokerGame.participants.players[player].name, terminator: " ")
            print(pokerGame.participants.players[player].hand.getCards)
        }
    }
    
    func testStart() {
        pokerGame.start()
        
        /*주어진 매개변수에 맞게 PokerGame 객체가 생성되었는지 확인*/
        
        //stud: 입력한 stud에 알맞는 카드 수를 할당했는가?
        (0..<pokerGame.participants.count).forEach { player in
            let playerHandCount = pokerGame.participants.players[player].hand.getCards.count
            XCTAssertEqual(playerHandCount, pokerGame.stud.cardCountForGame, "Wrong Player Hand Count")
        }
        
        //playerCount: 입력한 playerCount에 맞는 플레이어 수가 생성되었는가?
        (0..<pokerGame.participants.count).forEach { player in
            let playerCount = pokerGame.participants.count
            XCTAssertEqual(playerCount, pokerGame.playerCount.excludeDealer + 1, "Wrong Player Count")
        }
    }
}
