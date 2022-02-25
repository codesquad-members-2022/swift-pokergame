//
//  Player.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/24.
//

import Foundation


struct Player {
    
    private var player: [String] = []
    private var numberOfPlayer: Int
    
    mutating func namingPlayers() {
        let name = ["Jee", "Sol", "Selina", "Jed", "푸코", "Dale", "Eddy"]
        
        for appendPlayer in 1...numberOfPlayer {
            player.append("\(name[Int.random(in: 0..<name.count)])")
        }
    }
    
    init() {
        numberOfPlayer = Int.random(in: 1...4)
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "\(player)"
    }
}
