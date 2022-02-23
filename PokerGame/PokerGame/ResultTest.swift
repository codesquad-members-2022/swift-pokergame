//
//  ResultTest.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/23.
//

import Foundation

//Test케이스를 위한 클래스
final class ResultTest {

    private var deck:Deck       //굳이 Test case에서의 deck을 접근할 필요를 못느껴서 private로 선언했다.
    
    //MARK: -- 검사하고싶은 deck을 가져와서 해당 메서드가 잘 작동하면 true를 반환한다
    func removeOne() -> Bool {
        let beforeDeckCount = deck.count                                             //삭제 하고 난 뒤 갯수를 비교하기 위해 선언했다. //한개가 아닌 두개가 삭제됬을때를 대비하여 선언했다.
        let removedCard = deck.removeOne()
        if deck.cards.contains(where: { $0 == removedCard }) && beforeDeckCount - 1 == self.deck.count {              //메서드가 사용된 후 deck에서 제거된 카드가 없으면 성공이다.
            return false
        } else {
            return true
        }
    }
    
    //셔플하기 전과 후의 배열이 같다면 fasle를 다르면 true를 리턴하게 해봤다.
     func shuffle() -> Bool {
         let beforeShuffledDeck = deck.cards
         let shuffledDeck = deck.shuffle()
         if shuffledDeck == beforeShuffledDeck {
             return false
         } else {
             return true
         }
    }
    
     func reset() -> Bool {
         let resetDeck = Card.makeDeck()
         let currentDeck = deck.reset()
         
         if resetDeck == currentDeck {
             return true
         } else {
             return false
         }
    }
    
    init(deck:Deck) {
        self.deck = deck
    }
    
}
