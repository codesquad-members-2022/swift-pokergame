//___FILEHEADER___


@testable import 포커게임
import XCTest

class PokerGameTest: XCTestCase {
   
    //System Under Test
    private var sut : Deck!
    private var sut2 : PokerGame!
    
    //객체 생성 과정
    override func setUp() {
        sut = Deck()
        sut2 = PokerGame(numberOfGuest: .Four, mode: .SevenStud)
        super.setUp()
    }
    
    //테스트가 모두 진행이 된후 메모리에서 해제
    override func tearDown() {
        sut = nil
        sut2 = nil
        super.tearDown()
    }
    
    //Deck 관련 메소드 테스트
    func testDeckGeneration() throws {
        XCTAssertEqual(sut.count, 52, "\(DeckTestError.deckGenerationError)")
    }

    func testRemoveOne() throws {
        _ = sut.removeOne()
        XCTAssertEqual(sut.count, 51, "\(DeckTestError.deckRemoveError)")
    }
    
    func testShuffle() throws {
        sut.shuffle()
        XCTAssertEqual(sut.count, 52, "\(DeckTestError.deckShuffleError)")
    }

    func testDeckreset() throws {
        sut.reset()
        XCTAssertEqual(sut.count, 52, "\(DeckTestError.deckGenerationError)")
    }
    
    
    //PokerGame 관련 메소드 테스트
    func testsetTotalPlayers() throws {
        let totalPlayer = sut2.setPlayers()
        XCTAssertEqual(totalPlayer.count,5, "플레이어 세팅 실패!")
    }
    
    func testdealCard() throws {
        let totalPlayer = sut2.setPlayers()
        try sut2.dealer.dealCard(to: totalPlayer[0], from: sut)
        XCTAssertEqual(totalPlayer[0].cards.count, 1, "딜러가 현재 플레이어 들에게 줄 카드 부족")
    }
    
    func testresetPlayerCards() throws {
        let totalPlayer = sut2.setPlayers()
        try sut2.dealer.dealCard(to: totalPlayer[0], from: sut)
        totalPlayer[0].resetCards()
        XCTAssertEqual(totalPlayer[0].cards.count, 0, "플레이어 카드 초기화 실패")
    }
    
}
