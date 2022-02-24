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
    
    func testPockerGameStud() throws {
        let pockerTest1 = PockerGame(stud: .five, playerNumbers: .one)
        pockerTest1.play()
        XCTAssertEqual(pockerTest1.testPlayerCards(), true)
    }
    
    func testPockerGamePlayers() throws {
        let pockerTest1 = PockerGame(stud: .seven, playerNumbers: .four)
        pockerTest1.play()
        XCTAssertTrue(pockerTest1.testPlayerCards())
    }
}

