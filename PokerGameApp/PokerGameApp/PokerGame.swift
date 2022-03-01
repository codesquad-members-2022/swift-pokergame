//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/25.
//

import Foundation


class PokerGame {
    
    private let stud: Stud
    private let playerCount: Int
    private var dealer: Dealer
    private var players: Players

    enum Stud: Int{
        case five = 5
        case seven = 7
    }
    
    init(stud: Stud, playerCount: Int){
        self.stud = stud
        self.playerCount = playerCount
        dealer = Dealer()
        players = Players(playerCount: playerCount, dealer: dealer)
    }
    
    
    func start() {
        while dealer.isDealable(players: players, by: stud.rawValue) {
            dealer.distributeCard(to: players, by: stud.rawValue)
        }
    }

    
    
}
