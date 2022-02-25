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
    private var playerCount : Int
    var remainCardCount : Int {
        return dealer.cardDeckCount
    }
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.players = Players()
        self.dealer = Dealer()
        self.playerCount = playerCount.intValue
        seatPlayer(count: self.playerCount)
    }
    
    mutating func play() {
        draw(each: stud.initialCard)
        let oneCard = 1
        while dealer.cardDeckCount-playerCount >= 0 {
            draw(each: oneCard)
        }
    }
    
    private func draw(each : Int) {
        for _ in 0..<each {
            var oneCycleDraw = Cards()
            for _ in 0..<playerCount {
                guard let drawedCard = dealer.draw() else {break}
                oneCycleDraw.add(card:drawedCard)
            }
            players.eachReceive(cards: oneCycleDraw)
        }
    }
    
    private mutating func seatPlayer(count : Int) {
        var playerName = PlayerName()
        self.players.seat(player: dealer)
        for _ in 0..<count {
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
        
        var intValue : Int {
            return rawValue
        }
    }
    
    enum Stud : Int {
        case sevenCard = 7
        case fiveCard = 5
        
        var initialCard : Int {
            return rawValue
        }
    }
}
