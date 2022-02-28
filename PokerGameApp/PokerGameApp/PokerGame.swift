//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

class PokerGame {
    private var nameArray: [String] = ["HK", "JK", "Crong", "Honux", "Chloe", "Ivy", "Gucci"]
    enum Games {
        case sevenCardStud
        case fiveCardStud
    }
    enum PlayerCount: Int {
        case two = 2, three, four, five
    }
    
    private var cardDeck = CardDeck()
    var sortOfGame: Games
//    var playerCount: PlayerCount.RawValue = .random(in: 2...5)
    var playerCount: PlayerCount.RawValue
    var players: [Playable]
    var dealer: Dealer
    
    init(sortOfGame: Games, playerCount: PlayerCount.RawValue) {
        self.sortOfGame = sortOfGame
        self.playerCount = playerCount
        for index in 0..<playerCount {
            if index == 0 {
                self.dealer = Dealer()
            } else {
                self.players.append(Player(name: self.nameArray.remove(at: Int.random(in: 0..<self.nameArray.count))))
            }
        }
    }
}
