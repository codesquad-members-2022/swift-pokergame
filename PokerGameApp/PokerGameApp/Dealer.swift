//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/28.
//

import Foundation

class Dealer: Player{
    
    private var deck: CardDeck = CardDeck()
    
    convenience init(){
        self.init(name: "Dealer")
    }
    
    func deal() -> Card{
        return deck.removeOne()
    }
    
    func distributeCard(to players: Players, by stub: Int) {
        for _ in 0..<stub{
            for index in 0..<players.count() {
                players.receive(deal(), at: index)
            }
        }
    }
    
    func isDealable(players: Players, by stub: Int) -> Bool {
        if deck.count >= (players.count() * stub) {
            return true
        } else{
            return false
        }
    }

}
