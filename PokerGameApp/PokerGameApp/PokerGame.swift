//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class PokerGame {
    
    let dealer: Dealer
    let playerGroup: Array<Player>
    let playerNum: Int
    
    init() {
        self.dealer = Dealer()
        self.playerGroup = Array<Player>()
        self.playerNum = Int.random(in: 1...5)
    }
    
    func setCards() {
        dealer.serveCard()
    }
    
    
}
