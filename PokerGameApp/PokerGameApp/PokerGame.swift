//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class PokerGame {
    private let stud: Stud
    private let playerCount: PlayerCount
    private let gameDealer: Dealer
    private let team: Team
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.playerCount = playerCount
        let dealer = Dealer(name: "딜러", stud: stud)
        self.gameDealer = dealer
        self.team = Team(playerCount: playerCount, dealer: dealer)
    }
}

class Team {
    private let players: [Player]
    
    init(playerCount: PlayerCount, dealer: Dealer){
        var generatedPlayers = ParticipantFactory.generateParcipants(count: playerCount)
        generatedPlayers.append(dealer)
        self.players = generatedPlayers
    }
}
