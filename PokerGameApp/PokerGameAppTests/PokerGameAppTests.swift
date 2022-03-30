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
        let resultOfGamePlay : String = sut.informResult()
        
        //then
        XCTAssertNotNil(resultOfGamePlay, "\(resultOfGamePlay)")
    }
    
    func testShapeOfCard() {
        //given
        let heart = Shape.heart
        let spade = Shape.spade
        let club = Shape.club
        let diamond = Shape.diamond
        
        //when
        let order1: Bool = spade > diamond
        let order2: Bool = diamond > heart
        let order3: Bool = heart > club
        
        //then
        XCTAssertTrue(order1)
        XCTAssertTrue(order2)
        XCTAssertTrue(order3)
        
    }
}
