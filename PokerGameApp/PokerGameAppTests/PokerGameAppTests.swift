//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by Bibi on 2022/03/02.
//

import XCTest

@testable import PokerGameApp // 기능을 테스트할 모델 가져오기 - 모델의 내부 타입과 메서드에 접근 가능하게 함

class PokerGameAppTests: XCTestCase {
    
    var systemUnderTest: PokerGame! // System Under Test

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        systemUnderTest = PokerGame(playerNames: ["A", "B"]) // 테스트할 객체 생성
        // SUT는 setUpWithError()에서 만들고, tearDownWithError()에서 해제하는 것이 좋다.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        systemUnderTest = nil // 테스트한 객체 릴리즈
        try super.tearDownWithError()
    }
    
    func testIsPokerGameAllSet() {
        // given - 테스트에 필요한 값 설정
        systemUnderTest = PokerGame(playerNames: ["JK", "Honux", "Crong"])
        let cardNumber = 7
        
        // when - 테스트할 코드를 실행
        systemUnderTest.setCards()
        let dealerCardNum = systemUnderTest.getDealerCardsNum()
        let playerCardNums = systemUnderTest.getPlayersCardsNum()
        
        // then - 테스트에 기대되는 결과값 단정
        XCTAssertEqual(dealerCardNum, cardNumber)
        playerCardNums.map{ XCTAssertEqual($0, cardNumber) }           
    }

}
