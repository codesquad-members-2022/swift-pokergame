//
//  Player.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/23.
//

import Foundation

protocol Playable {
    func receive(cards: [Card])
}

class Player: Playable {
    let name: String
    private var cards: [Card] = []
    
    static var candidates = ["Eddy", "Jason", "Chez", "Dale", "Sally", "Jed", "Jee", "Ebony", "Sol", "Gucci"]
    
    init(name: String) {
        self.name = name
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}
