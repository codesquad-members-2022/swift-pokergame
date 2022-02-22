//
//  Card.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/23.
//

import Foundation
class Card {
    //카드모양 에 관련된 이모지 를 열거형으로 선언 하여 관련된 값들을 Suit 를 통해 쉽게 얻을수 있음.
    //각 카드 는 4개의 다른 모양의 suit 가 있으므로 Card 클래스 안에 선언.
    enum Suit : Character, CaseIterable {
        case spades = "♠️", clubs = "♣️", heart = "♥️", diamonds = "♦️"
    }
    
    //각 카드의 값들을 열거형으로 선언 하여 관련된 값들을 Rank 를 통해 쉽게 얻을수 있음.
    //ace 부터 ten 까지 는 1~10의 Int, J,Q,K 의 값들은 후에 유니코드 -> Character 로 변환될 예정.
    enum Rank : Int, CaseIterable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack = 74, king, queen = 81
    }
    
    //Card 의 프로퍼티 선언
    var suit: Suit
    var rank: Rank
    
    //Card 의 정보. Computed Property 로 선언하여 이니셜라이즈 된후 info 의 값이 아래의 과정을 통해 할당된다.
    var info : String {
        if rank.rawValue > Rank.ten.rawValue {
            return "\(suit.rawValue)\(Character(UnicodeScalar(rank.rawValue)!))"
        }else {
            return "\(suit.rawValue)\(rank.rawValue)"
        }
    }
        
    init (suit: Suit, rank: Rank){
        self.suit = suit
        self.rank = rank
    }
    
}
