//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class PokerGame {
    
    private let dealer: Dealer
    private let playerGroup: Array<Player>
    private var names: [String] = ["JK", "Honux", "Crong"]
    private let playerNum: Int
    private let cardStud = 7
    
    init() {
        self.playerNum = names.count
        self.dealer = Dealer()
        var playerGroup = Array<Player>()
        for name in names {
            playerGroup.append(Player(name: name))
        }
        self.playerGroup = playerGroup
    }
    
    func setCards() {
        while dealer.getDeckCount() > playerNum {
            for player in playerGroup {
                guard let card = dealer.pickCard() else {
                    return
                }
                player.addCard(card)
            }
            if let card = dealer.pickCard() {
                dealer.addCard(card)
            }
            if dealer.getCardsCount() == cardStud { return }
        }
    }
}
