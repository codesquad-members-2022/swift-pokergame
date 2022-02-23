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
    private var cards = [Card]()
    
    init () {
       generateCard()
    }
    
    //모든 suit 와 rank 를 돌면서 cards 배열에 append.
    private func generateCard() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases{
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    
}
