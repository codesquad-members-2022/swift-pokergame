//
//  Team.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/25.
//

import Foundation

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
