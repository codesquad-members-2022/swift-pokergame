//
//  Player.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/24.
//

import Foundation


struct Player {
    
    private var player: [String] = []
    
    init(player: [String]) {
        self.player = player
    }
    
    func determineThePlayer() -> Int {
        return Int.random(in: 1...4)
    }
    
    mutating func namingPlayers(playerNumber: Int) {
        let name = ["Jee", "Sol", "Selina", "Jed", "푸코", "Dale", "Eddy"]
        
        for appendPlayer in 1...playerNumber {
            player.append("\(name[Int.random(in: 0..<name.count)])")
        }
    }
    
    
    
    
    
    
    
}
