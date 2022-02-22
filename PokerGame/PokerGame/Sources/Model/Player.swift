//
//  Player.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class Player: CustomStringConvertible {
    let name: String
    public private(set) var cards: [CardData] = []
    
    var description: String {
        "Name: \(name), cards: \(cards)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: CardData) {
        cards.append(card)
    }
}
