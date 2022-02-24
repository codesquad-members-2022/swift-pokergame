//
//  Score.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class Score: CustomStringConvertible, Comparable {
    
    let rule: Rule
    let highNumber: Card.Number
    
    var description: String {
        "\(rule)(\(highNumber))"
    }
    
    init(rule: Rule, highNumber: Card.Number) {
        self.rule = rule
        self.highNumber = highNumber
    }
    
    static func == (lhs: Score, rhs: Score) -> Bool {
        lhs.rule == rhs.rule
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        if lhs.rule == rhs.rule {
            return lhs.highNumber < rhs.highNumber
        }
        return lhs.rule < rhs.rule
    }
}

extension Score {
    enum Rule: Int, Comparable {
        
        case none, onePair, twoPair, triple, straight, fourCard
        
        static func < (lhs: Score.Rule, rhs: Score.Rule) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}
