//
//  Pokergame.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation
struct PokerGame {
    var cardDeckCount : Int {
        return cardDeck.count
    }
    private var cardDeck : CardDeck = CardDeck()
    private let dealer : Dealer
    private var players : [Player] = []
    private let stud : Stud
    private let playerCount : Int
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        let playerCount = playerCount.rawValue
        self.dealer = Dealer(cardDeck: cardDeck)
        self.playerCount = playerCount + 1
        seatPlayer(playerCount: playerCount)
    }
    mutating func play() {
        drawCard(each: self.stud.rawValue)
        while cardDeck.count != 0 {
            drawCard(each: 1)
        }
    }
    
    func drawCard(each : Int) {
        for _ in 0..<each {
            for player in players {
                guard let drawedCard = dealer.draw() else {break}
                player.getCard(card: drawedCard )
            }
        }
    }
    private mutating func seatPlayer(playerCount : Int) {
        var playerName = PlayerName()
        self.players.append(dealer)
        for _ in 0..<playerCount {
            let name = playerName.popName()
            self.players.append(Player(name: name))
        }
    }

    enum PlayerCount : Int{
        case one = 1
        case two
        case three
        case four
    }
    enum Stud : Int {
        case sevenCard = 7
        case fiveCard = 5
    }
}
