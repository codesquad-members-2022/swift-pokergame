import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    
    var sut:PokerGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PokerGame(sortOfGame: .sevenCardStud, playerCount: .four)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCardIsDestributed2Players() {
        //give
        let _ = sut.play()
        
        //when
        let result = sut.dealer.cardCount
        
        //then
        XCTAssertEqual(result, 7)
    }
    
    func testNumberOfParicipants() {
        //give
        let given = sut.playerCount
        
        //when
        let suggest = sut.players.count
        
        //then
        XCTAssertEqual(suggest, given.rawValue + 1)
        
    }
    
    func testDidGameInformResult() {
        //give
        let _ = sut.play()
        
        //when
        let resultOfGamePlay : String = sut.informResult(sut.computer)
        
        //then
        XCTAssertNotNil(resultOfGamePlay, "\(resultOfGamePlay)")
    }
    
    func testOrderOfShape() {
        //given
        let heart = Shape.heart
        let spade = Shape.spade
        let club = Shape.club
        let diamond = Shape.diamond
        
        //when
        let order1: Bool = spade > diamond
        let order2: Bool = diamond > heart
        let order3: Bool = heart > club
        let order4: Bool = spade < club
        
        //then
        XCTAssertTrue(order1)
        XCTAssertTrue(order2)
        XCTAssertTrue(order3)
        XCTAssertFalse(order4)
    }
    
    // 실패가 나게끔 처리한 코드
    func testPickWinner() {
        // given
        let _  = sut.play()
        let consoleBanner = sut.informResult(sut.computer)
        
        // when
        let winner = sut.pickWinner(sut.players, sut.computer)
        print(consoleBanner)
        
        // then
        XCTAssertEqual(winner.name, "", "승자는 \(winner.name)입니다")
    }

}
