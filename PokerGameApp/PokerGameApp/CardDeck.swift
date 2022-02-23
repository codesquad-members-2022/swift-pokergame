//
//  CardDeck.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/23.
//

import Foundation

//덱에 있는 카드 위치, 갯수 에 대한 정보를 하나의 객체 에서 관리 하기위해서 class 로 Deck 을 구현.
class Deck {
    //덱의 카드 내용을 private 으로 지정함으로써 은닉화.
    //인덱스를 이용한 shuffle 과 마지막에 있는 카드를 삭제해주는 과정을 쉽게해주기 위해 배열 타입으로 정의.
    private var cards = [Card]()
    
    //현재 카드 갯수 정보
    var count : Int {cards.count}
        
    
    init () {
       generateCards()
    }
    
    //모든 suit 와 rank 를 돌면서 cards 배열에 append.
    private func generateCards() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases{
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    //Optimized Fisher-Yates algorithm by Durstenfeld
    //해당 덱에있는 카드들의 순서를 무작위로 바꾼다.
    func shuffle() {
        var scratch  = self.cards
        var range = self.count
        while range != 1 {
            let roll = Int.random(in: 0..<range)
            let temp = scratch[range-1]
            scratch[range-1] = scratch[roll]
            scratch[roll] = temp
            range -= 1
        }
        //랜덤 순열을 reversed 해서 self.cards 에 할당.
        self.cards = scratch.reversed()
    }
  
    //removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    //카드 뭉치 중에 무작위로 하나를 반환하고 삭제하는지, 카드 뭉치 들중 가장위에 있는 카드를 뽑아서 반환하고 삭제하건지 명확히 명시되어 있지않아
    //카드뭉치의 맨 위에 있는카드를 뽑아 반환하고 삭제하는것으로 가정하고 함수 구현. 이 가정이 틀릴시 수정 필요.
    func removeOne() -> Card {
        return self.cards.removeLast()
    }
    
    //현재 남아 있는 카드뭉치를 전부 제거한뒤, 새로운 카드뭉치 생성.
    func reset() {
        self.cards.removeAll()
        generateCards()
    }
    
    
}
