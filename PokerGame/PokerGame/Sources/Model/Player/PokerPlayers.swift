//
//  Players.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class PokerPlayers {
    
    enum Constants {
        static let limitCount = 4
        static let defaultCount = 2
    }
    
    public private(set) var players = [Player]()
    public private(set) var dealer = Player(name: "Dealer")
    
    var count: Int {
        players.count + 1
    }
    
    func removeAllCard() {
        players.forEach {
            $0.removeAllCard()
        }
        dealer.removeAllCard()
    }
    
    func createPlayers(count: Int) {
        var playerNames = ["shingha", "bibi", "alex", "rosa", "chez",
                           "ocean", "Jason", "Alex", "dale", "kai",
                           "jee", "mase", "sol", "ebony", "gucci",
                           "jed", "beck", "eddy", "selina", "pigBag"].filter { $0.count <= 5}

        (0..<count).forEach { _ in
            let randomIndex = Int.random(in: 0..<playerNames.count)
            let playerName = playerNames.remove(at: randomIndex)
            players.append(Player(name: playerName))
        }
        
        dealer = Player(name: "Dealer")
    }
}
