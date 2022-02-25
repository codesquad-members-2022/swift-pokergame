//
//  Player.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class Player {
    private var cards = [Card]()
    private let name: String
    
    init(name: String) {
        self.name = name
    }

    func handOver(cards: [Card]) {
        cards.forEach { self.cards.append($0) }
    }
    
    func state() -> PlayerViewModel {
        return PlayerViewModel(name: self.name, cards: self.cards)
    }
}

class Guest: Player {}

struct PlayerViewModel {
    let name: String
    let cards: [Card]
}
