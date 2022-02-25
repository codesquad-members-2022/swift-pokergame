//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by jsj on 2022/02/25.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    
    // MARK:- ParticipantFactory
    func testParticipantFactory_isCorrectGenerateCount() throws {
        let guests = ParticipantFactory.generateGuests(count: .four)
        let expectCount = 4
        XCTAssertEqual(guests.count, expectCount)
    }
    
    func testParticipantFactory_multipleName_whenGenerateGuests() throws {
        let guests = ParticipantFactory.generateGuests(count: .four)
        var isMultipleName = false
        var names = [String]()
        for guest in guests {
            if names.contains(guest.state().name) {
                isMultipleName = true
                break
            }
            names.append(guest.state().name)
        }
        XCTAssertFalse(isMultipleName, "중복으로 생성된 플레이어 이름이 없다")
    }
    
    // MARK:- Dealer
    func testDealer_isOutOfCardDeckWhenStartGame() throws {
        let dealer = Dealer(name: "딜러", stud: .five)
        let team = Team(guestCount: .four, dealer: dealer)
        
        dealer.prepare()
        dealer.start(with: team) { isOutOfCard in
            if isOutOfCard {
                XCTAssertTrue(dealer.isOutOfCard(), "딜러가 덱이 빌때까지 카드를 한장씩 나눠주었나")
            }
        }
    }
    
    // MARK:- PokerGame
    func testGame_afterPrepare_isSameCardCountPlayers() {
        let game = PokerGame(stud: .seven, guestCount: .four)
        game.prepare()
        let playersState = game.playersState()
        
        var isNotSameCardCount = false
        for state in playersState {
            if state.cards.count != 7 {
                isNotSameCardCount = true
            }
        }
        XCTAssertEqual(playersState.count, 5, "게임 준비 후, 모든 참가자의 수는 방문자와 딜러수의 합이다")
        XCTAssertFalse(isNotSameCardCount, "게임 준비 후, 모든 참가자의 카드갯수가 7장이다")
    }
    
    func testGame_isCorrectTotalCardCount_whenGameEnd() throws {
        let game = PokerGame(stud: .seven, guestCount: .four)
        game.prepare()
        game.run { isEnd in
            if !isEnd {
                return
            }
            let playerState = game.playersState()
            let allCardCount = playerState.reduce(0, { (result, player) in
                return result + player.cards.count
            })
            XCTAssertEqual(allCardCount, 52, "게임이 끝났을때 모든 참가자가 가진 카드 수의 합은 52장이다")
        }
    }
}
