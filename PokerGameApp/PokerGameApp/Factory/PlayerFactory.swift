//
//  PlayerFactory.swift
//  Pocker
//
//  Created by 송태환 on 2022/02/28.
//

import Foundation

struct PlayerFactory {
    static func makeDealer(rule: Dealer.Rule) -> Dealer {
        let deck = CardDeckFactory.create()
        return Dealer(deck: deck, rule: rule)
    }
    
    static func makePlayers(names: [String] = ["JK", "Honux", "Cron", "Ivy"]) -> [Player] {
        return names.map { Player(name: $0) }
    }
}

