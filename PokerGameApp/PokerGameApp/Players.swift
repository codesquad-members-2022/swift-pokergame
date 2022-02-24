//
//  Players.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/24.
//

import Foundation

struct Players {
    private var players : [Player] = []
    var count : Int {
        return players.count
    }
    
    mutating func seat(player: Player) {
        self.players.append(player)
    }
    
    func eachReceive(card: Card) {
        for player in players {
            player.receiveCard(card: card )
        }
    }
    
}
