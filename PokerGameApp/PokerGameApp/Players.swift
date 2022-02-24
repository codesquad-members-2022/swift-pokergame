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
    var playersCardCount : [Int] {
        var cardCount : [Int] = []
        for player in players {
            cardCount.append(player.handCount)
        }
        return cardCount
    }
    
    mutating func seat(player: Player) {
        self.players.append(player)
    }
    
    func eachReceive(cards: Cards) {
        var cards = cards
        for player in players {
            guard let popedCard = cards.pop() else {break}
            player.receiveCard(card: popedCard)
        }
    }
    
}
