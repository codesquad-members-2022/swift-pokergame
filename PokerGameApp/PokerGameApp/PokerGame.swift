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
        case one = 1, two, three, four
    }
    static var round: Int = 0
    
    private var cardDeck = CardDeck()
    var sortOfGame: Games
    var playerCount: PlayerCount
    var players: [Player] = []
    var dealer: Dealer = Dealer()

    var computer: Computer = Computer()
    
    init(sortOfGame: Games, playerCount: PlayerCount) {
        self.sortOfGame = sortOfGame
        self.playerCount = playerCount
        for index in 0..<playerCount.rawValue {
        if index == 0 {
            self.players.append(Player(name: self.nameArray.remove(at: Int.random(in: 0..<self.nameArray.count))))
            }
        }
    }
}
