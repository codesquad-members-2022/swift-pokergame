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
    private(set) var isEnd: Bool = false
    
    init(stud: Stud, guestCount: GuestCount) {
        self.stud = stud
        self.guestCount = guestCount
        let dealer = ParticipantFactory.generateDealer(stud: stud)
        self.gameDealer = dealer
        self.team = Team(guestCount: guestCount, dealer: dealer)
    }
    
    func prepare() {
        gameDealer.prepare()
        gameDealer.distributeCard(to: team)
    }
    
    func run() {
        gameDealer.start(with: team) { isOutOfCard in
            if isOutOfCard {
                isEnd = true
            }
        }
    }
    
    func playersState() -> [PlayerViewModel] {
        return self.team.playersState()
    }
}

class Team {
    private let players: [Player]
    
    init(guestCount: GuestCount, dealer: Dealer){
        var generatedPlayers: [Player] = ParticipantFactory.generateGuests(count: guestCount)
        generatedPlayers.append(dealer)
        self.players = generatedPlayers
    }
    
    func playersState() -> [PlayerViewModel] {
        return players.map{ $0.state() }
    }
    
    func loop(act: (Player) -> Void) {
        for player in players {
            act(player)
        }
    }
}
