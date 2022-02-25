//
//  Participants.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

class Participants {
    
    var players: [Playable]
    var count: Int {
        return players.count
    }
    
    init(playerCount: Int, dealer: Dealer) {
        self.players = (0..<playerCount).map { number in
            Player(name: "player\(number + 1)") }
        self.players.append(dealer)
    }
}
