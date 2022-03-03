import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    var sut:PokerGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PokerGame(sortOfGame: .fiveCardStud, playerCount: .two)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCardIsDestributed2Players() {
        //give
        let _ = sut.play()
        
        //when
        let _ = sut.open()
        
        //then
        XCTAssertEqual(sut.deckCount(), 17, "The number of card isn't the same")
    }
}
