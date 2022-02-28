//
//  PlayerFactoryTest.swift
//  DeckTest
//
//  Created by 박진섭 on 2022/02/26.
//

import XCTest
@testable import PokerGame

class PlayerTest: XCTestCase {

    var sut:PlayerFactory!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PlayerFactory()
    }

    //Player Factory에서 검증해야할 중요한 기능은 1. 모드에 맞게 사람 수 생성 2. 사람 수 에 맞는 랜덤한 이름 부여. 라고 생각해서 나누어서 테스트 했습니다.
    
    //각 모드별로 1명씩 player가 증가하면 성공이라고 가정하고 Test를 작성했습니다.
    func testsetPlayerModeCount() {
        let singlePlayerMode = PlayerFactory.makePlayers(mode: .singlePlayer)
        let twoPlayerMode = PlayerFactory.makePlayers(mode: .twoPlayer)
        let threePlayerMode = PlayerFactory.makePlayers(mode: .threePlayer)
        let fourPlayerMode = PlayerFactory.makePlayers(mode: .fourPlayer)
        
        let playersCounts = [singlePlayerMode.count,twoPlayerMode.count, threePlayerMode.count, fourPlayerMode.count]
        
        var count = 0
        var result:Bool = false
        
        playersCounts.forEach {
            count += 1
            result = ($0 - count == 0)
        }
        
        XCTAssertTrue(result)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
