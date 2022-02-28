//
//  Playable.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

protocol Playable {
    //TODO: 프로토콜에선 private 선언을 못하는 이유?
    func addCard(card: Card, round: Int)
    func showUpCards() -> String
    func openAllCards() -> String
    func getHand(playerDeck: [Card], computer: Computer)
    
    var name: String { get }
    var hand: Computer.Hands { get set }
    var playerDeck: [Card] { get set }
    var upCards: [Card] { get set }
}
