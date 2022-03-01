//
//  Playable.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/28.
//

import Foundation

class Players {
    
    private var sampleNames: [String] {
        let names = ["rosa","singha","gucci","kai","jee","eddy"]
        return names.shuffled()
    }
    private(set) var players: [Player] = Array()

    init(playerCount: Int, dealer: Dealer){
        for index in 0..<playerCount {
            players.append(Player(name:sampleNames[index]))
        }
        players.append(dealer)
    }
    
    func count() -> Int{
        return players.count
    }
    
    func receive(_ card: Card, at index: Int){
        players[index].receive(card)
    }
    
}
