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
    
    var cards:[Card]
    var count:Int  { self.cards.count }    //Deck안에 있는 Card들은 함수의 호출에 따라 값이 달라지므로 computedproperty로 정의했다.
    
    //init시 덱을 만들도록 설정봤다.
    init() {
        self.cards = Card.makeDeck()
    }
    
}
