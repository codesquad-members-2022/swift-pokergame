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
    private let players: [Player]
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.gameDealer = Dealer(stud: stud)
        self.players = ParticipantFactory.generateParcipants(count: participantCount)
        self.playerCount = playerCount
    }
}
