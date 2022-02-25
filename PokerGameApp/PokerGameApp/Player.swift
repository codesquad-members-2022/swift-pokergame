//
//  Player.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

protocol Playable {
    var name: String { get }
    var hand: Hand { get }
    func receive(card: Card)
}

class Player: Playable {
    
    private(set) var name: String
    private(set) var hand: Hand
    
    init() {
        self.hand = Hand()
        
        // TODO: 랜덤한 이름으로 생성되도록 변경
        self.name = "RandomName"
    }
}

extension Playable {
    func receive(card: Card) {
        self.hand.receive(card: card)
    }
}
