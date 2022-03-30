//
//  ComputerTest.swift
//  ComputerTest
//
//  Created by YEONGJIN JANG on 2022/03/30.
//

import XCTest
@testable import PokerGameApp

class ComputerTest: XCTestCase {
    
    var sut: Computer!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Computer()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testBackStraightFlush() {
        //give
        let playerDeck : [Card] = [Card(shape: .club, rank: .ace),
                                   Card(shape: .club, rank: .two),
                                   Card(shape: .club, rank: .three),
                                   Card(shape: .club, rank: .four),
                                   Card(shape: .club, rank: .five),
                                   Card(shape: .club, rank: .seven),
                                   Card(shape: .club, rank: .eight)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .backStraightFlush)
    }
    
    //TODO: Straight 가 나와야하는데 왜 BackStraight 가 나올까?
    func testStraightFlush() {
        //give
        let playerDeck : [Card] = [Card(shape: .diamond, rank: .three),
                                   Card(shape: .club, rank: .two),
                                   Card(shape: .club, rank: .three),
                                   Card(shape: .club, rank: .four),
                                   Card(shape: .club, rank: .five),
                                   Card(shape: .spade, rank: .queen),
                                   Card(shape: .club, rank: .six)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .straightFlush)
    }
    
    func testFourCard() {
        //give
        let playerDeck : [Card] = [Card(shape: .diamond, rank: .three),
                                   Card(shape: .club, rank: .three),
                                   Card(shape: .spade, rank: .three),
                                   Card(shape: .heart, rank: .three),
                                   Card(shape: .club, rank: .five),
                                   Card(shape: .spade, rank: .queen),
                                   Card(shape: .heart, rank: .six)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .fourCard)
    }
    
    func testFullHouse() {
        //given
        let playerDeck : [Card] = [Card(shape: .club, rank: .ten),
                                   Card(shape: .heart, rank: .ten),
                                   Card(shape: .club, rank: .ten),
                                   Card(shape: .club, rank: .jack),
                                   Card(shape: .diamond, rank: .five),
                                   Card(shape: .heart, rank: .two),
                                   Card(shape: .spade, rank: .two)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .fullHouse)
    }
    
    func testBackStraight() {
        //given
        let playerDeck : [Card] = [Card(shape: .diamond, rank: .ace),
                                   Card(shape: .club, rank: .two),
                                   Card(shape: .spade, rank: .three),
                                   Card(shape: .heart, rank: .four),
                                   Card(shape: .club, rank: .five),
                                   Card(shape: .spade, rank: .queen),
                                   Card(shape: .heart, rank: .king)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .backStraight)
    }
    
    func testStraight() {
        //given
        let playerDeck : [Card] = [Card(shape: .club, rank: .ten),
                                   Card(shape: .heart, rank: .nine),
                                   Card(shape: .club, rank: .king),
                                   Card(shape: .club, rank: .jack),
                                   Card(shape: .diamond, rank: .five),
                                   Card(shape: .heart, rank: .queen),
                                   Card(shape: .spade, rank: .two)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .straight)
    }
    
    func testTriple() {
        //given
        let playerDeck : [Card] = [Card(shape: .club, rank: .ten),
                                   Card(shape: .heart, rank: .three),
                                   Card(shape: .club, rank: .king),
                                   Card(shape: .club, rank: .jack),
                                   Card(shape: .diamond, rank: .king),
                                   Card(shape: .heart, rank: .five),
                                   Card(shape: .spade, rank: .king)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .triple)
    }
    
    func testTwoPair() {
        //given
        let playerDeck : [Card] = [Card(shape: .club, rank: .ten),
                                   Card(shape: .heart, rank: .ten),
                                   Card(shape: .club, rank: .ace),
                                   Card(shape: .club, rank: .jack),
                                   Card(shape: .diamond, rank: .king),
                                   Card(shape: .heart, rank: .five),
                                   Card(shape: .spade, rank: .king)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .twoPair)
    }
    
    func testOnePair() {
        //given
        let playerDeck : [Card] = [Card(shape: .club, rank: .ten),
                                   Card(shape: .heart, rank: .ten),
                                   Card(shape: .club, rank: .ace),
                                   Card(shape: .club, rank: .jack),
                                   Card(shape: .diamond, rank: .three),
                                   Card(shape: .heart, rank: .five),
                                   Card(shape: .spade, rank: .eight)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .onePair)
    }
    
    func testHighCard() {
        //given
        let playerDeck : [Card] = [Card(shape: .club, rank: .ace),
                                   Card(shape: .heart, rank: .three),
                                   Card(shape: .diamond, rank: .five),
                                   Card(shape: .spade, rank: .seven),
                                   Card(shape: .club, rank: .nine),
                                   Card(shape: .heart, rank: .jack),
                                   Card(shape: .diamond, rank: .eight)]
        
        //when
        let hand : Hand = sut.getHand(playerDeck)
        
        //then
        XCTAssertEqual(hand, .highCard)
    }
    
}
