//___FILEHEADER___


@testable import 포커게임
import XCTest

class ___FILEBASENAMEASIDENTIFIER___: XCTestCase {
    private var sut : Deck!
    
    //객체 생성 과정
    override func setUp() {
        sut = Deck()
        super.setUp()
    }
    
    //테스트가 모두 진행이 된후 메모리에서 해제
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDeckGeneration() throws {
        XCTAssertEqual(sut.count, 52, "\(TestError.deckGenerationError)")
    }

    func testRemoveOne() throws {
        _ = sut.removeOne()
        XCTAssertEqual(sut.count, 51, "\(TestError.deckRemoveError)")
    }
    
    func testShuffle() throws {
        sut.shuffle()
        XCTAssertEqual(sut.count, 52, "\(TestError.deckShuffleError)")
    }

    func testDeckreset() throws {
        sut.reset()
        XCTAssertEqual(sut.count, 52, "\(TestError.deckGenerationError)")
    }



}
