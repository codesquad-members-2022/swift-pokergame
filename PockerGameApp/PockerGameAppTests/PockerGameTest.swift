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
        guard let card = dealer.takeCardFromDealer() else{
            return
        }
        player.takeCard(card: card)
        XCTAssertEqual(player.playerCardCount, 1)
    }
    
    func testPlayersNumbers() throws{
        let playerNumber: PockerGame.PlayerNumber = .four
        let players = Players(numbers: playerNumber)
        XCTAssertEqual(playerNumber.playerNumber, 4)
    }
    
    func testPlayersTakeCard() throws{
        let playerNumber: PockerGame.PlayerNumber = .four
        let players = Players(numbers: playerNumber)
        for i in 0 ..< playerNumber.playerNumber{
            guard let card = dealer.takeCardFromDealer() else {
                return
            }
            players.takeCard(index: i, card: card)
        }
        XCTAssertEqual(players.playersCardCountSum, 4)
    }
    
    func testStudCardNumber() throws{
        let pockerGame = PockerGame(stud: .five, playerNumber: .four)
        pockerGame.play()
        XCTAssertEqual(pockerGame.players.playersCardCountSum, 20)
        
        let pockerGame2 = PockerGame(stud: .seven, playerNumber: .three)
        pockerGame2.play()
        XCTAssertEqual(pockerGame2.players.playersCardCountSum, 21)
    }
    
}

