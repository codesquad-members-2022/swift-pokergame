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
    
    init(name: String) {
        self.hand = Hand()
        self.name = name
    }
}

extension Playable {
    func receive(card: Card) {
        self.hand.receive(card: card)
    }
}
