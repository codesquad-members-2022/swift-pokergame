//
//  Player.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class Player: CustomStringConvertible, Comparable {
    let name: String
    private var cards: [Card] = []
    var score: Score?
    
    var description: String {
        "Name: \(name), cards: \(cards)"
    }
    
    var hasScore: Bool {
        score != nil
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
    
    func cardSorted() -> [Card] {
        cards.sorted()
    }
    
    func cardNumberCounting() -> [Card.Number:Int]{
        cards.reduce(into: [Card.Number:Int]()) {
            $0[$1.number] = ($0[$1.number] ?? 0) + 1
        }
    }
    
    func scoreCalculation() {
        score = Score.calculation(player: self)
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        guard let lhsScore = lhs.score else {
            return false
        }
        
        guard let rhsScore = rhs.score else {
            return false
        }
    
        return lhsScore < rhsScore
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.score == rhs.score
    }
}
