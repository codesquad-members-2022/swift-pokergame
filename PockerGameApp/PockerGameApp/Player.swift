//
//  Player.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/23.
//

import Foundation

protocol Playable {
    var cards: [Card] { get }
    
    func receive(cards: [Card])
}

class Player: Playable {
    let name: String
    var cards: [Card] = []
    
    static var candidates = ["Eddy", "Jason", "Chez", "Dale", "Sally", "Jed", "Jee", "Ebony", "Sol", "Gucci"]
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = Player.candidates.randomElement()!
        self.cards = []
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}
