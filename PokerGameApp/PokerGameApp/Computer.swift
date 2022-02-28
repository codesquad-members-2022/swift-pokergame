//
//  Computer.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

class Computer {
    enum Hands: Comparable {
        case highCard
        case onePair
        case twoPair
        case triple
        case straight
        case flush
        case fullHouse
        case fourCard
        case straightFlush
        case royalStraightFlush
    }
    private var players: [Playable]
    init(dealer: Dealer, players: [Player]) {
        self.players.append(dealer)
        for player in players {
            self.players.append(player)
        }
    }
    func getHand(players: [Playable]) {
        
    }
}
