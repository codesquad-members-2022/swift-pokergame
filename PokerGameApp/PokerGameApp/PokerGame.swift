//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/25.
//

import Foundation


class PokerGame {
    
    private let stud: Stud
    private let playerCount: PlayerCount
    private var dealer: Dealer
    private var players: Players

    enum Stud: Int{
        case five = 5
        case seven = 7
    }
    
    enum PlayerCount: Int {
        case one = 1
        case two
        case trhee
        case four
    }
    
    init(stud: Stud, playerCount: PlayerCount){
        self.stud = stud
        self.playerCount = playerCount
        dealer = Dealer()
        players = Players(playerCount: playerCount.rawValue, dealer: dealer)
    }
    
    
    func start() {
        while dealer.isDealable(players: players, by: stud.rawValue) {
            dealer.distributeCard(to: players, by: stud.rawValue)
        }
    }

    
    
}
