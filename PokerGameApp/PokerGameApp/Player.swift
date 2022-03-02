//
//  Player.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

class Player: Participant {
    override var description: String {
        return "👤User(\(name)): \(self.cards)"
    }
    
    private var name: String
    var cards = [Card]()
    
    
    init(name: String) {
        self.name = name
    }
    
    
    override func receive(card: Card) {
        cards.append(card)
    }
}
