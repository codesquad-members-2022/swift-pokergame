//
//  Player.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

struct Player {
    private(set) var cards = [Card]()
    private let name: String
    
    init(name: String) {
        self.name = name
    }

    mutating func handOver(cards: [Card]) {
        cards.forEach { self.cards.append($0) }
    }
}
