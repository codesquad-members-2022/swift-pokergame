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
    private var sortOfGame: Games
    private var playerCount: PlayerCount
    private var players: [Player] = []
    private var dealer: Dealer = Dealer()
    
    private var computer: Computer = Computer()
    
    init(sortOfGame: Games, playerCount: PlayerCount) {
        self.sortOfGame = sortOfGame
        self.playerCount = playerCount
        for _ in 0..<playerCount.rawValue {
            self.players.append(Player(name: self.nameArray.remove(at: Int.random(in: 0..<self.nameArray.count))))            }
    }
    
    func play() {
        cardDeck.reset()
        cardDeck.shuffle()
        dealer.giveCard2Player(players: players, deck: cardDeck)
    }
    func deckCount() -> Int {
        return cardDeck.cardCount
    }
    func open() {
        print(players.count)
        print("딜러 = \(dealer.openAllCards())")
        for player in players {
            print("\(player.name) = \(player.openAllCards())")
        }
    }
}
