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
        let beforeCards = cardDeck.cards
        cardDeck.shuffle()
        let afterCards = cardDeck.cards
        var isNotEqualSequence = false

        for cardIndex in 0..<cardDeck.count() {
            if (beforeCards[cardIndex] != afterCards[cardIndex]) {
                isNotEqualSequence = true
                break
            }
        }
        isNotEqualSequence
            ?printWithFormat("카드가 잘 섞였습니다")
            :printWithFormat("Fail-섞지 못함. 카드 순서가 같습니다.")
    }
    
    private func printWithFormat(_ description: String, line: Int = #line, function: String = #function) {
        let debugString = "▫️line\(line):\(function):: \(description)"
        print(debugString)
    }
}
