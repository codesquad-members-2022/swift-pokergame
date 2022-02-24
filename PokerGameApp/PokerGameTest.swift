import XCTest
@testable import PokerGameApp

class PokerGameTest: XCTestCase {
    
    private var pokerGame: PokerGame!
    
    override func setUp(){
        pokerGame = PokerGame(numberOfPlayers: PokerGame.Count.four, stud: PokerGame.Stud.five)
        super.setUp()
    }
    
    
    func testInitialization(){
        XCTAssertEqual(pokerGame.dealer.name, "딜러")
        XCTAssertEqual(pokerGame.players.count, 4)
    }
    
    func testCardDistribution(){
        pokerGame.start()
        for player in pokerGame.players{
            XCTAssertEqual(player.cards.count, pokerGame.stud.rawValue)
        }
        XCTAssertEqual(pokerGame.dealer.cards.count, pokerGame.stud.rawValue)
    }

}
