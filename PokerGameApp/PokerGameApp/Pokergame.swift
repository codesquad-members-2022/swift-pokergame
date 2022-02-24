//
//  Pokergame.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation
struct PokerGame {
    private let dealer : Dealer
    private var players : Players
    private let stud : Stud
    private var playerCount : Int {
        return self.players.count
    }
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.players = Players()
        self.dealer = Dealer()
        seatPlayer(playerCount: playerCount)
    }
    
    mutating func play() {
        drawCard(each: self.stud.rawValue)
        while dealer.cardDeckCount-playerCount >= 0 {
            drawCard(each: 1)
        }
    }
    
    private func drawCard(each : Int) {
        for _ in 0..<each {
            var oneCycleDraw : [Card] = []
            for _ in 0..<playerCount {
                guard let drawedCard = dealer.draw() else {break}
                oneCycleDraw.append(drawedCard)
            }
            players.eachReceive(cards: oneCycleDraw)
        }
    }
    
    private mutating func seatPlayer(playerCount : PlayerCount) {
        var playerName = PlayerName()
        self.players.seat(player: dealer)
        for _ in 0..<playerCount.rawValue {
            let name = playerName.popName()
            let newPlayer = Player(name: name)
            self.players.seat(player: newPlayer)
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
