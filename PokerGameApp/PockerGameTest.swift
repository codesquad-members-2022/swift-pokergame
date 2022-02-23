import XCTest
@testable import PokerGameApp

class PockerGameTest: XCTestCase {
    
    private var pockerGame: PockerGame!
    
    override func setUp(){
        pockerGame = PockerGame(numberOfPlayers: PockerGame.Count.four, stud: PockerGame.Stud.five)
        super.setUp()
    }
    
    
    func testInitialization(){
        XCTAssertEqual(pockerGame.dealer.name, "딜러")
        XCTAssertEqual(pockerGame.players.count, 4)
    }
    
    func testCardDistribution(){
        pockerGame.start()
        for player in pockerGame.players{
            XCTAssertEqual(player.cards.count, pockerGame.stud.rawValue)
        }
        XCTAssertEqual(pockerGame.dealer.cards.count, pockerGame.stud.rawValue)
    }

}
