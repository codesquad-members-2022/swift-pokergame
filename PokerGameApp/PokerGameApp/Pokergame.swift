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
        let oneCard = 1
        while dealer.playAble(with: players.count){
            draw(each: oneCard)
        }
    }
    
    private func draw(each : Int) {
        for _ in 0..<each {
            let oneCycleDraw = playerCount.drawLoop(dealer)
            players.eachReceive(cards: oneCycleDraw)
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
        
        var drawLoop : (Dealer) -> Cards {
            {(dealer: Dealer) -> Cards in
            var oneCycleDraw = Cards()
            for _ in 0..<rawValue{
                guard let drawedCard = dealer.draw() else {break}
                oneCycleDraw.add(card:drawedCard)
            }
            return oneCycleDraw
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
