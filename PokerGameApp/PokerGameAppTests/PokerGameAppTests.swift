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
        let roundOne = sut.play()
        
        //when
        let printCards = sut.open()
        
        //then
        XCTAssertEqual(sut.deckCount(), 47, "The number of card isn't the same")
    }
}
