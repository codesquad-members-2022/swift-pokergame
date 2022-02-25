//
//  Deck.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/23.
//

import Foundation

//카드의 모음인 Deck
//Deck에서 카드를 뽑거나 shuffle을 한다면 해당 Deck참조를 가지고 있는 모든 객체들의 값이 바뀌어야 하므로 Struct대신 Class로 구현했다.
final class Deck:Equatable {
    
    //suffle Test시 Deck의 카드들을 비교하기 위해 Equatable프로토콜을 채택했습니다.
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        lhs.usedCards == rhs.usedCards
    }
    
    //reset시 다시 Card의 배열을 생성해서 값을 바꾸는것보다 초깃값을 가지는 프로퍼티를 하나더 만들어서 reset시 초기값을 넣어주는 형태를 생각해 봤다.
    private var defaultCards:[Card]
    private var usedCards:[Card]
    
    var count:Int  { self.usedCards.count }    //Deck안에 있는 Card들은 함수의 호출에 따라 값이 달라지므로 computedproperty로 정의했다.
    
    init(cards:[Card]) {
        self.defaultCards = cards
        self.usedCards = cards
    }
    
    //MARK: -- 함수들. //내부의 값을 변환시키는 메서드와 값을 변환시키면서 리턴도하는 함수를 구분해서 만들어 보았습니다.
    //Knuth Shuffle방법은 각 반복마다 남은 element를 셀 필요가 없으므로 Fisher-Yates shuffle보다 시간복잡도 면에서 더 좋을것 같아 택했다.
    func shuffle() {
        for cardIndex in 0..<self.count {
            let randomIndex = Int.random(in: cardIndex..<self.count)      //card의 index범위 내에서 랜덤한 index를 뽑고
            usedCards.swapAt(cardIndex, randomIndex)                      //Array의 기능중 하나인 Swap을 이용 교체한다.
        }
    }
    
    func shuffled() -> [Card] {
        shuffle()
        return self.usedCards
    }
    
    func removeOne() {
        if self.count > 0 {
            self.usedCards.removeLast()
        }
    }
    
    func removedOne() -> Card? {
        guard let removedCard = self.usedCards.popLast() else { return  nil}
        return removedCard
    }
    
    
    //사용한 card들을 초기 값으로 바꾸어줌으로써 reset함.
    func reset() {
        self.usedCards = self.defaultCards          //함수의 테스트를 위해 리턴값을 주었는데 reset함수는 리턴값 없이도 테스트가 가능할 것 같아 리턴값을 뺴주었습니다.
    }
}
