//
//  Deck.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/23.
//

import Foundation

//카드의 모음인 Deck
//Deck에서 카드를 뽑거나 shuffle을 한다면 해당 Deck참조를 가지고 있는 모든 객체들의 값이 바뀌어야 하므로 Struct대신 Class로 구현했다.
class Deck {
    var description: String {
        return """
        총 \(count)카드가 있습니다.
        """
    }
    
    var cards:[Card]                        //현제 전체 카드들의 정보는 private로 숨기려고 했으나 테스트 케이스를 위해 internal로 주었다.
    var count:Int  { self.cards.count }    //Deck안에 있는 Card들은 함수의 호출에 따라 값이 달라지므로 computedproperty로 정의했다.
    
    //init시 덱을 만들도록 설정봤다.
    init() {
        self.cards = Card.makeDeck()
    }
    
    //MARK: -- 함수들. 함수가 실행될 시 제대로 작동이 되는지 확인을 하기위해 리턴값으로 예상되는 값의 타입을 리턴해보았다
    
    //Knuth Shuffle방법은 각 반복마다 남은 element를 셀 필요가 없으므로 Fisher-Yates shuffle보다 시간복잡도 면에서 더 좋을것 같아 택했다.
    func shuffle() -> [Card]{
        for cardIndex in 0..<self.count {
            let randomIndex = Int.random(in: cardIndex..<self.count)   //card의 index범위 내에서 랜덤한 index를 뽑고
            cards.swapAt(cardIndex, randomIndex)                      //Array의 기능중 하나인 Swap을 이용 교체한다.
        }
        return self.cards                                             //[1,2,3]배열과 [1,3,2]의 배열은 다른것을 이용해서 비교할 생각이다.
    }
    
    //랜덤한 카드 하나 빼기
    func removeOne() -> Card{
        let randomindex = Int.random(in: 0..<self.count)
        let removedCard = cards.remove(at: randomindex)
        return removedCard
    }
    
    //카드를 리셋시키자.
    func reset() -> [Card] {
        self.cards = Card.makeDeck()
        return self.cards
    }
}
