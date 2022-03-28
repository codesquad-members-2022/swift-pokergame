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
        let _ = sut.giveCard2Player()
        
        //when
        let result = sut.printSomeoneCards(player: sut.dealer)
        
        //then
        XCTAssertEqual(result, "")
    }
}
