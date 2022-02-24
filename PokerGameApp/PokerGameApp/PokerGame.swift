//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class PokerGame {
    private let stud: Stud
    private let guestCount: GuestCount
    private let gameDealer: Dealer
    private let team: Team
    
    init(stud: Stud, guestCount: GuestCount) {
        self.stud = stud
        self.guestCount = guestCount
        let dealer = Dealer(name: "딜러", stud: stud)
        self.gameDealer = dealer
        self.team = Team(guestCount: guestCount, dealer: dealer)
    }
}

class Team {
    private let players: [Player]
    
    init(guestCount: GuestCount, dealer: Dealer){
        var generatedPlayers: [Player] = ParticipantFactory.generateGuests(count: guestCount)
        generatedPlayers.append(dealer)
        self.players = generatedPlayers
    }
}
