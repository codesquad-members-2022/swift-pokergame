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
        draw()
    }
    
    private func draw() {
        stud.loop(with: self.playerCount){ playerIndex in
                guard let drawedCard = dealer.draw() else {return}
                players.eachReceive(card: drawedCard, index: playerIndex)
        }
    }
    
    private func seatPlayer() {
        self.players.seat(player: dealer)
        var playerName = PlayerName()
        playerCount.loop() {_ in
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
        
        func loop(event: @escaping (Int)->Void) {
            for index in 0...rawValue {
                event(index)
            }
        }
    }
    
    enum Stud : Int {
        case sevenCard = 7
        case fiveCard = 5
        
        var initialCard : Int {
            return rawValue
        }
        
        func loop(with playerCount : PlayerCount, event: @escaping (Int)->Void) {
            for _ in 0..<rawValue {
                playerCount.loop(){ playerIndex in
                    event(playerIndex)
                }
            }
        }
    }
}
