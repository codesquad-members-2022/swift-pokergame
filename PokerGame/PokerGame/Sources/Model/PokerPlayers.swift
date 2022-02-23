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
        static let defaultCount = 4
    }
    
    private var players = [PokerPlayer]()
    
    var count: Int {
        players.count
    }
    
    var playerNames: [String] {
        players.map{ $0.name }
    }

    func removeAllCard() {
        players.forEach {
            $0.removeAllCard()
        }
    }
    
    func addCard(at index: Int, card: Card) {
        players[index].add(card: card)
    }

    func set(players: [PokerPlayer]) {
        self.players = players
    }
}
