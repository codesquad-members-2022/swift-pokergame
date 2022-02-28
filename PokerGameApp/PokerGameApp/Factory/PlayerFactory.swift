//
//  PlayerFactory.swift
//  Pocker
//
//  Created by 송태환 on 2022/02/28.
//

import Foundation

struct PlayerFactory {
    private static let defaultPlayerNames = ["JK", "Honux", "Cron", "Ivy", "HK", "Chloe", "Conux", "Avy", "BK", "CK"]
    
    static func makeDealer(rule: Dealer.Rule) -> Dealer {
        let deck = CardDeckFactory.create()
        return Dealer(deck: deck, rule: rule)
    }
    
    static func makePlayers(names: [String] = defaultPlayerNames) -> [Player] {
        if self.defaultPlayerNames == names {
            return (0...3).map { Player(name: self.defaultPlayerNames[$0]) }
        }
        
        return names.map { Player(name: $0) }
    }
    
    static func makePlayers(count: Int) -> [Player] {
        let validNumber = count > self.defaultPlayerNames.count ? self.defaultPlayerNames.count : count
        
        return (0...validNumber-1).map { i in
            let name = self.defaultPlayerNames[i]
            return Player(name: name)
        }
    }
}

