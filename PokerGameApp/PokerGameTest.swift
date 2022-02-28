import XCTest
@testable import PokerGameApp

class PokerGameTest: XCTestCase {
    
    private var pokerGame: PokerGame!
    
    override func setUp(){
        pokerGame = PokerGame(numberOfPlayers: Players.Count.four, stud: PokerGame.Stud.five)
        super.setUp()
    }
    
    
    func testInitialization(){
        XCTAssertEqual(pokerGame.dealer.currentName, "딜러")
        XCTAssertEqual(pokerGame.players.count, 4)
    }
    
    func testCardDistribution(){
        pokerGame.start()
        var playerIterator = pokerGame.players.getIterator(additionalPlayer: nil)
        while let player = playerIterator.next(){
            XCTAssertEqual(player.cardsCount, pokerGame.stud.rawValue)
        }
        XCTAssertEqual(pokerGame.dealer.cardsCount, pokerGame.stud.rawValue)
    }

}
