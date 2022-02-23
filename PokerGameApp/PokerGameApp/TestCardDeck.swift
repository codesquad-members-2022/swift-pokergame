//
//  TestCardDeck.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/23.
//

import Foundation

class TestCardDeck {
    private let cardDeck: CardDeck!
    
    init() {
        self.cardDeck = CardDeck()
    }
    
    func countWhenInit() {
        let count = cardDeck.count()
        let expect = 52
        if count != expect {
            printWithFormat("Fail-초기화했을때 카드 갯수가 예상값(\(expect)가 아닙니다")
            return
        }
        printWithFormat("\(expect)개로 초기화 완료")
    }
    
    func count(expect: Int) {
        let count = cardDeck.count()
        if count != expect {
            printWithFormat("Fail-카드 갯수가 예상값(\(expect)가 아닙니다")
            return
        }
        printWithFormat("예상값\(expect)과 일치")
    }
    
    func removeOne() {
        let removedCard = cardDeck.removeOne()
        let currentCardCount = cardDeck.count()
        guard let card = removedCard else {
            printWithFormat("카드를 삭제하지 못했습니다. 현재 카드갯수 \(currentCardCount)개.")
            return
        }
        printWithFormat("\(card) \(currentCardCount)개의 카드가 남았습니다.")
    }
    
    func resetWhenRemoveOne() {
        cardDeck.removeOne()
        cardDeck.reset()
        let expectCount = Card.all().count
        if cardDeck.count() != expectCount {
            printWithFormat("Fail-카드 갯수가 예상값(\(expectCount)가 아닙니다")
            return
        }
        printWithFormat("예상값\(expectCount)과 일치")
    }
    
    func shuffle() {
        //1. 카드 섞기 전, 현재 카드 배열을 들고온다
        //2. 카드 섞고나서의 카드 배열을 들고온다
        //3. 1,2 카드 순서가 같은지 비교한다
//        let beforeCards = cardDeck.cards()
//        cardDeck.shuffle()
//        let afterCards = cardDeck.cards()
//        var isEqualSequence = true
//
//        for beforeCard in 0..<beforeCards.count {
//            for afterCard in 0..<afterCards.count {
//                if beforeCard != afterCard {
//                    isEqualSequence = false
//                }
//            }
//        }
//        isEqualSequence
//            ?printWithFormat("카드가 잘 섞였습니다")
//            :printWithFormat("Fail-섞지 못함. 카드 순서가 같습니다.")
    }
    
    private func printWithFormat(_ description: String, line: Int = #line, function: String = #function) {
        let debugString = "▫️line\(line):\(function):: \(description)"
        print(debugString)
    }
}
