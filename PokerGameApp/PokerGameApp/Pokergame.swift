//
//  Pokergame.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation
struct PokerGame {
    var cardDeck = CardDeck()
    var dealer : Dealer
    var player : [Player] = []
    let stud : Stud
    let playerCount : PlayerCount
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.playerCount = playerCount
        var playerName = PlayerName()
        for _ in 0..<playerCount.rawValue {
            let name = playerName.popName()
            self.player.append(Player(name: name))
        }
        self.dealer = Dealer(cardDeck: cardDeck)
    }
    mutating func play() {
        
    }

    enum PlayerCount : Int{
        case one = 1
        case two
        case three
        case four
    }
    enum Stud {
        case sevenCard
        case fiveCard
    }
}
