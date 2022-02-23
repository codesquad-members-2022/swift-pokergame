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
        let game = PockerGame(variant: PockerGame.Variants.sevenCardStud, entries: PockerGame.Entries.four)
        
        game.playPockerGame()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
