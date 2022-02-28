//
//  DeckTest.swift
//  DeckTest
//
//  Created by 박진섭 on 2022/02/25.
//

import XCTest
@testable import PokerGame

class DeckTest: XCTestCase {
    var factory:DeckFactory!
    var sut:Deck!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        factory = DeckFactory()
        sut = DeckFactory.makeDeck()
    }
        
    //Equatable시 비교되는 값은 Deck의 usedCards 프로퍼티입니다.
    //약 10번정도의 shuffle을 했음에도 같지 않다면 shuffle이 잘된것이라 판단했습니다.
     func testSuffule() {
         let deck0 = DeckFactory.makeDeck()
         let deck1 = DeckFactory.makeDeck()
        
         for _ in 0..<10  {
            deck0.shuffle()
            deck1.shuffle()
            XCTAssertNotEqual(deck0, deck1)
         }
    }
    
     func testSuffuled() {
         let deck0 = DeckFactory.makeDeck()
         let deck1 = DeckFactory.makeDeck()
        
        let suffledCards0 = deck0.shuffled()
        let suffeldCards1 = deck1.shuffled()
        
        XCTAssertNotEqual(suffledCards0, suffeldCards1)
        
    }
    
    //52개의 카드가 순서대로 정상적으로 제거된후 리턴이 되고, 이전에 지운카드와 앞으로 지울 카드가 52번동안 다르다면 test가 정상이라고 생각했습니다.
    func testRemovedOne() {
        let deck = DeckFactory.makeDeck()
        
        let testCount = 52
        var removedCard:Card?
        
        for _ in 0..<testCount {
            let willRemoveCard = deck.removedOne()
            
            XCTAssertTrue(willRemoveCard != removedCard)
            
            removedCard = willRemoveCard
        }
    }
    
    //origin Deck과 사용중이던 Deck을 originDeck과 비교하여 같다면 reset이 잘된것이라 판단하였습니다.
    func testReset() {
        let originDeck = DeckFactory.makeDeck()
        let usedDeck = DeckFactory.makeDeck()
        
        usedDeck.reset()
        
        XCTAssertEqual(originDeck, usedDeck)
    }
    
    override func tearDownWithError() throws {
        factory = nil
        sut = nil
        try? super.tearDownWithError()
    }
}


