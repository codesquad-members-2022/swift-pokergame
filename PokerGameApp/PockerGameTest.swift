import XCTest
@testable import PokerGameApp

class PockerGameTest: XCTestCase {
    
    private var pockerGame: PockerGame!
    
    override func setUp(){
        pockerGame = PockerGame(numberOfPlayers: 4, stud: 5)
        super.setUp()
    }
    
    
    func testInitialization(){
        XCTAssertEqual(pockerGame.dealer.name, "딜러", "Dealer Successfully Created")
        XCTAssertEqual(pockerGame.players.count, 4)
    }
    
    func testCardDistribution(){
        pockerGame.start()
        for player in pockerGame.players{
            XCTAssertEqual(player.cards.count, pockerGame.stud)
        }
        XCTAssertEqual(pockerGame.dealer.cards.count, pockerGame.stud)
    }

}
