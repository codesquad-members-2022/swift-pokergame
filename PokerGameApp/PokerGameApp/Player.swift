//
//  Player.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class Player {
    
    private let name: String
    private var cards: Array<Card>
    
    init() {
        self.name = Array<String>(["A", "B", "C", "D", "E"])[Int.random(in: 0...4)]
        self.cards = Array<Card>()
    }
}
