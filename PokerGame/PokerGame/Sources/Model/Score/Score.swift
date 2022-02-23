//
//  Score.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class Score {
    static func calculation(player: Player) -> Score.Rule {
        var cardByNumber: [Card.Number:Int] = [:]
        player.cards.forEach {
            let count = cardByNumber[$0.number] ?? 0
            cardByNumber[$0.number] = count + 1
        }
        let sortCard = player.cards.sorted(by: {return $0.number.rawValue < $1.number.rawValue })
        print(sortCard)
        
        if cardByNumber.values.contains(4) {
            return .fourCard
        } else if cardByNumber.values.contains(3) {
            return .triple
        } else if cardByNumber.values.contains(2) {
            let pairCount = cardByNumber.values.filter{ $0 == 2 }.count
            if pairCount >= 2 {
                return .twoPair
            } else {
                return .onePair
            }
        } else {
            let sortCard = player.cards.sorted(by: {return $0.number.rawValue < $1.number.rawValue })
            print(sortCard)
        }
        
        return .none
    }
}

extension Score {
    enum Rule {
        case none, onePair, twoPair, triple, straight, fourCard
    }
}
