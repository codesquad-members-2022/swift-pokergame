//
//  Player.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/24.
//

import Foundation

struct Player {
    
    private var names: [String] = [] // 이름
    private var numberOfPlayer = Int.random(in: 1...4)
    private var dealer = "딜러🌟"
    
    init() {
        var name = ["Jee", "Sol", "Selina", "Jed", "푸코", "Dale", "Eddy"]
        
        for appendPlayer in 1...numberOfPlayer {
            let count = Int.random(in: 0..<name.count)
            
            names.append("\(name[count])")
            name.remove(at: count)
        }
        names.append(dealer)
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "\(names)"
    }
}
