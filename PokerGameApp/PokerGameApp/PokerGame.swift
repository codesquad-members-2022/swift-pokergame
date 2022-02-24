//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class PokerGame {
    private let stud: Stud
    private let participantCount: ParticipantCount
    private let gameDealer: Dealer
    private let players: [Player]
    
    init(stud: Stud, participantCount: ParticipantCount) {
        self.stud = stud
        self.participantCount = participantCount
        self.gameDealer = Dealer(stud: stud)
        self.players = []
    }
    
    enum ParticipantCount: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }
}
