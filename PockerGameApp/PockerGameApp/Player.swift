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
    
    static func getRandomPlayerNames(pick: Int) -> [String] {
        
        func getCombination(pick: Int, from array: [String]) -> [String] {
            guard !array.isEmpty, pick > 0 else { return [] }
            
            let roll = Int.random(in: 0..<array.count)
            let prefix = array[roll]
            
            if pick == 1 { return [prefix] }
            let combinationOfRemains = getCombination(pick: pick-1, from: Array(array.dropFirst(roll)))
            return [prefix] + combinationOfRemains
        }
        
        return getCombination(pick: pick, from: Player.candidates)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}
