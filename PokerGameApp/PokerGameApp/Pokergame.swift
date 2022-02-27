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
    private var playerCount : PlayerCount
    var remainCardCount : Int {
        return dealer.cardDeckCount
    }
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.players = Players()
        self.dealer = Dealer()
        self.playerCount = playerCount
        seatPlayer()
    }
    
    mutating func play() {
        draw(each: stud.initialCard)
    }
    
    private func draw(each : Int) {
        for _ in 0..<each {
            playerCount.loop(){ playerIndex in
                guard let drawedCard = dealer.draw() else {return}
                players.eachReceive(card: drawedCard, index: playerIndex)
            }
        }
    }
    
    private mutating func seatPlayer() {
        self.players.seat(player: dealer)
        let seatedPlayer = playerCount.seatLoop(players)
        self.players = seatedPlayer
    }

    enum PlayerCount : Int{
        case one = 1
        case two
        case three
        case four
        
        func loop(event: @escaping (Int)->Void) {
            for index in 0...rawValue {
                event(index)
            }
        }
        
        var seatLoop : (Players) -> Players {
            {(players: Players) -> Players in
                var seatedPlayers = players
                var playerName = PlayerName()
                for _ in 0..<rawValue {
                    let name = playerName.popName()
                    let newPlayer = Player(name: name)
                    seatedPlayers.seat(player: newPlayer)
                }
                return seatedPlayers
            }
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
