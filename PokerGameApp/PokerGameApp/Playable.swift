//
//  Playable.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

protocol Playable {
    //TODO: 프로토콜에선 private 선언을 못하는 이유?
//    속성도 get set으로 선언 되어있어서 사실상 메서드라고 봐야함.
    func addCard(card: Card, round: Int)
    func showUpCards() -> String
    func openAllCards() -> String
}
