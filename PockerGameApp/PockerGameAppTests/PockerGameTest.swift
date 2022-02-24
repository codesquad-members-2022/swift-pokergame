//
//  PockerGameTest.swift
//  PockerGameAppTests
//
//  Created by 김동준 on 2022/02/24.
//

import XCTest
import UIKit
@testable import PockerGameApp

class PockerGameTest: XCTestCase {
    let dealer = Dealer()
    
    func testPlayerTakeCard() throws {
        let player = Player(name: Players.playerNames[0])
        guard let card = dealer.giveCardToPlayer() else{
            return
        }
        player.receiveCard(card: card)
        XCTAssertEqual(player.playerCardCount, 1)
    }
    
    func testPlayersNumbers() throws{
        let playerNumber: PockerGame.PlayerCount = .four
        let players = Players(playerCount: playerNumber)
        XCTAssertEqual(players.count, 4)
    }
    
    func testPlayersTakeCard() throws{
        let playerNumber: PockerGame.PlayerCount = .four
        let players = Players(playerCount: playerNumber)
        for index in 0 ..< playerNumber.getNumberOfPlayer(){
            guard let card = dealer.giveCardToPlayer() else {
                return
            }
            players.takeCard(index: index, card: card)
        }
        XCTAssertEqual(players.allCardCount, 4)
    }
    
    func testStudCardNumber() throws{
        let pockerGame = PockerGame(stud: .five, playerCount: .four)
        pockerGame.play()
        XCTAssertEqual(pockerGame.players.allCardCount, 20)
        
        let pockerGame2 = PockerGame(stud: .seven, playerCount: .three)
        pockerGame2.play()
        XCTAssertEqual(pockerGame2.players.allCardCount, 21)
    }
    
}

