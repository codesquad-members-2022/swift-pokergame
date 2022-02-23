import XCTest
@testable import PokerGameApp

class CardDeckTest: XCTestCase {
    
    private var deck: CardDeck!
    
    override func setUp() {
        self.deck = CardDeck()
    }
    
    func testInitialization(){
        XCTAssertEqual(deck.count, 52)
    }
    
    func testShuffle(){
        deck.shuffle()
        let originalDeck = CardDeck()
        XCTAssertNotEqual(originalDeck, deck)
    }
    
    func testRemoveOne(){
        deck.reset()
        XCTAssertNotNil(deck.removeOne())
        XCTAssertEqual(deck.removeOne()!.suit.description, "♥︎")
    }
    
    func testReset(){
        XCTAssertNotNil(deck.removeOne())
        deck.reset()
        XCTAssertEqual(deck.count, 52)
    }

}
