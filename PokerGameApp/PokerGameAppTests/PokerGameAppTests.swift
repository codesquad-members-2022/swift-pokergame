import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    var sut:PokerGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PokerGame(sortOfGame: .sevenCardStud, playerCount: .two)
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
}
