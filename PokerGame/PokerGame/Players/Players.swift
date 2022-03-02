//
//  Players.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/28.
//

import Foundation

class Players {
    
    private let numberOfPlayer: NumberOfPlayer
    private var players: [Player] = []
    private var names = ["Jee", "Rosa", "Jed", "Sol", "푸코", "Mase"]
    var playerCount: Int {
        return players.count
    }
    
    init(numberOfPlayer: NumberOfPlayer) {
        self.numberOfPlayer = numberOfPlayer
        
        for _ in 0..<numberOfPlayer.rawValue {
            let name = names.shuffled()[0]
            
            players.append(Player(name: name))
        }
    }    
}
