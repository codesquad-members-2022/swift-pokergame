//
//  Player.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class Player: CustomStringConvertible {
    
    let name: String
    public private(set) var cards: [Card] = []
    
    var score: Score? {
        Score.calculation(player: self)
    }
    
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        "Name: \(name), cards: \(cards)"
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    func removeAllCard() {
        cards.removeAll()
    }
    
    func sort() {
        cards.sort(by: {$0.number.rawValue < $1.number.rawValue})
    }
}
