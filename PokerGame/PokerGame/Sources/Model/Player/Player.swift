//
//  Player.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class Player: CustomStringConvertible {
    let name: String
    private var cards: [Card] = []
    
    var description: String {
        return "Name: \(name), cards: \(cards)"
    }
    
    var score: Score? {
        Score.calculated(cards: cards)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    func removeAllCard() {
        cards.removeAll()
    }
}
