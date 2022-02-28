//
//  Player.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

struct Player: Participant, CustomStringConvertible {
    var description: String {
        return "👤User(\(name)): \(self.cards)"
    }
    
    var name: String
    var cards = [Card]()
    
    
    // 카드를 받습니다.
    mutating func receive(card: Card) {
        cards.append(card)
    }
}
