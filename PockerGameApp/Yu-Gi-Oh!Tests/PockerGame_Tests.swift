//
//  Yu_Gi_Oh_Tests.swift
//  Yu-Gi-Oh!Tests
//
//  Created by juntaek.oh on 2022/02/23.
//

import XCTest
@testable import PockerGameApp

class PockerGameTest: XCTestCase {
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testExample() throws {
        let randomVariant = PockerGame.Variants.allCases.randomElement()!
        let randomEntries = PockerGame.Entries.allCases.randomElement()!
        
        let game = PockerGame(variant: randomVariant, entries: randomEntries)
        var playGameTurn = 1
        var playerHavingCards = ""
        
        let cardNum = game.dealerShuffle()
        
        while game.playingLoop(){
            for _ in 0..<randomVariant.caseNumber{
                if game.playingLoop(){
                    game.divideCards()
                }else{
                    break
                }
                playerHavingCards = game.showAllCardInHand()
            }
            
            if game.playingLoop(){
                game.clearGame()
                playGameTurn += 1
            } else{
                break
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
