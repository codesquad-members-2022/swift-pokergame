//
//  PokerPlayer.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class PokerPlayer: Player {
    
    var playerNames = ["shingha", "bibi", "alex", "rosa", "chez",
                       "ocean", "Jason", "Alex", "dale", "kai",
                       "jee", "mase", "sol", "ebony", "gucci",
                       "jed", "beck", "eddy", "selina", "pigBag"]
    
    init() {
        let name = playerNames.filter{ $0.count >= 2 && $0.count <= 5 }.randomElement() ?? "noName"
        super.init(name: name)
    }
}
