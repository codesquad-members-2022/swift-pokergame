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
}

class Guest: Player {}
